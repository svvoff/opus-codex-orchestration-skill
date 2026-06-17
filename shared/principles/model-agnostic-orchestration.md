# Model-Agnostic Orchestration

The system should not hardcode one model as the only possible orchestrator.

Use a shared Orchestrator Contract so that Opus, ChatGPT, or another capable reasoning model can operate the delivery loop with the same task selection, validation, review, and documentation rules.

The executor remains Codex unless the user explicitly designs a different execution backend.
