# Model-Agnostic Orchestration

This skill pack can generate target-project configuration for:

```text
Opus primary orchestrator -> executor (Codex or Claude Code)
ChatGPT fallback orchestrator -> executor (Codex or Claude Code)
Codex-only emergency mode for trivial scoped tasks
```

## Why

Opus may be token-limited or unavailable. The delivery loop should not stop completely when the primary orchestrator is unavailable, but fallback should not silently reduce quality or safety.

## Design

The target repository should contain:

```text
docs/ai/orchestrator/
  ORCHESTRATOR.md
  fallback-policy.md
  handoff-state.md

CLAUDE.md
CHATGPT.md
AGENTS.md
```

- `ORCHESTRATOR.md` defines shared behavior for any orchestrator.
- `CLAUDE.md` defines Opus primary behavior.
- `CHATGPT.md` defines conservative fallback behavior.
- `AGENTS.md` defines Codex executor behavior; the `.claude/skills/executor/` skill defines Claude Code executor behavior; both materialize `EXECUTOR.md`.
- `handoff-state.md` records mode switches.

## No silent downgrade

When switching from Opus to ChatGPT, record the switch and enforce fallback restrictions. High-risk tasks should require explicit approval.
