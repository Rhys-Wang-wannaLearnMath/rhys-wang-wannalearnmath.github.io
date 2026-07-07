---
title: "AI-NativeBench: An Open-Source White-Box Agentic Benchmark Suite for AI-Native Systems"
collection: publications
# manuscripts代表journal，conference代表conference
category: conferences
category1: manuscripts
# 下列这个代表你的目录

# # 下列是简短的介绍
# excerpt: "Our work presents the first comprehensive empirical study of open-source LLM failures, analyzing 706 real-world issues to reveal that crashes and incorrect functionality dominate, primarily caused by environment compatibility and configuration errors. The research contributes a publicly available dataset for future research."

date: 2026-01-15
field: 'AI&SE'
venue_short: "FSE'26 (CCF A)"
venue_short1: "TOSEM (CCF A)"
# TOSEM (CCF A)
# 下列venue代表文章的状态，记得<i>和</i>是斜体
venue: 'Accepted at <i>The 34th ACM International Conference on the Foundations of Software Engineering Workshop on Data Intensive Software Engineering</i> <a href="https://seed-vt.github.io/dise/">[Link]</a>'
venue1: 'Accepted at <i>The ACM Transactions on Software Engineering and Methodology</i> (Extended Version)'
paperurl: 'https://dl.acm.org/doi/10.1145/3821576'
arxivurl: 'https://arxiv.org/abs/2601.09393'
projecturl: 'https://github.com/AINativeOps/AINativeBench'
doiurl: 'https://dl.acm.org/doi/epdf/10.1145/3821576'
bibtexurl: |
  @article{10.1145/3821576,
  author = {Wang, Zirui and Yu, Guangba and Lyu, Michael R.},
  title = {AI-NativeBench: An Open-Source White-Box Agentic Benchmark Suite for AI-Native Systems},
  year = {2026},
  publisher = {Association for Computing Machinery},
  address = {New York, NY, USA},
  issn = {1049-331X},
  url = {https://doi.org/10.1145/3821576},
  doi = {10.1145/3821576},
  abstract = {The transition from Cloud-Native to AI-Native architectures is fundamentally reshaping software engineering, replacing deterministic microservices with probabilistic agentic services. However, this shift renders traditional black-box evaluation paradigms insufficient: existing benchmarks measure raw model capabilities while remaining blind to system-level execution dynamics. To bridge this gap, we introduce AI-NativeBench, the first application-centric and white-box AI-Native benchmark suite grounded in Model Context Protocol (MCP) and Agent-to-Agent (A2A) standards. By treating agentic spans as first-class citizens within distributed traces, our methodology enables granular analysis of engineering characteristics beyond simple capabilities.Leveraging this benchmark across 21 system variants, we uncover critical engineering realities invisible to traditional metrics: a parameter paradox where lightweight models often surpass flagships in protocol adherence, a pervasive inference dominance that renders protocol overhead secondary, and an expensive failure pattern where self-healing mechanisms paradoxically act as cost multipliers on unviable workflows. This work provides the first systematic evidence to guide the transition from measuring model capability to engineering reliable AI-Native systems. To facilitate reproducibility and further research, we have open-sourced the benchmark and dataset.},
  note = {Just Accepted},
  journal = {ACM Trans. Softw. Eng. Methodol.},
  month = jul,
  keywords = {AI-Native System, Benchmarking, Multi-Agent, Agentic Service, Trace}
  }
citation: '<u>Zirui Wang</u>*, Guangba Yu*†, Michael R. Lyu'
---
