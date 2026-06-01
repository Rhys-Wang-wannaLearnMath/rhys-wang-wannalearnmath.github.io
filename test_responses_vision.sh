#!/usr/bin/env bash
set -euo pipefail

: "${BASE_URL:?请先设置 BASE_URL，例如 https://api.openai.com/v1}"
: "${API_KEY:?请先设置 API_KEY}"
: "${MODEL:?请先设置 MODEL}"

python3 - <<'PY'
import struct
import zlib
import base64

w, h = 64, 32
rows = []

for y in range(h):
    row = bytearray()
    row.append(0)
    for x in range(w):
        if x < w // 2:
            row.extend([255, 0, 0])
        else:
            row.extend([0, 0, 255])
    rows.append(bytes(row))

raw = b"".join(rows)

def chunk(kind: bytes, data: bytes) -> bytes:
    return (
        struct.pack(">I", len(data))
        + kind
        + data
        + struct.pack(">I", zlib.crc32(kind + data) & 0xffffffff)
    )

png = (
    b"\x89PNG\r\n\x1a\n"
    + chunk(b"IHDR", struct.pack(">IIBBBBB", w, h, 8, 2, 0, 0, 0))
    + chunk(b"IDAT", zlib.compress(raw))
    + chunk(b"IEND", b"")
)

with open("/tmp/vision_test.png", "wb") as f:
    f.write(png)

with open("/tmp/vision_test.b64", "w") as f:
    f.write(base64.b64encode(png).decode("ascii"))

print("已生成测试图片: /tmp/vision_test.png")
PY

IMG_B64="$(cat /tmp/vision_test.b64)"

cat > /tmp/responses_vision_payload.json <<JSON
{
  "model": "$MODEL",
  "input": [
    {
      "role": "user",
      "content": [
        {
          "type": "input_text",
          "text": "请判断这张图片左半部分和右半部分分别是什么颜色。只用中文回答，例如：左边是X，右边是Y。"
        },
        {
          "type": "input_image",
          "image_url": "data:image/png;base64,$IMG_B64",
          "detail": "low"
        }
      ]
    }
  ],
  "max_output_tokens": 50
}
JSON

curl -sS "$BASE_URL/responses" \
  -H "Authorization: Bearer $API_KEY" \
  -H "Content-Type: application/json" \
  -d @/tmp/responses_vision_payload.json \
  > /tmp/responses_vision_result.json

echo "====== 原始响应 JSON ======"
cat /tmp/responses_vision_result.json
echo
echo

echo "====== 尝试提取回答文本 ======"
python3 - <<'PY'
import json

with open("/tmp/responses_vision_result.json", "r", encoding="utf-8") as f:
    data = json.load(f)

if isinstance(data, dict) and data.get("output_text"):
    print(data["output_text"])
else:
    texts = []
    for item in data.get("output", []) if isinstance(data, dict) else []:
        for c in item.get("content", []) if isinstance(item, dict) else []:
            if isinstance(c, dict):
                if c.get("type") in ("output_text", "text", "output_text_delta") and c.get("text"):
                    texts.append(c["text"])
    print("\n".join(texts) if texts else "未找到文本输出，请看上面的原始 JSON。")
PY
