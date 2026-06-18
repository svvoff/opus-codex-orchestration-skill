# Profile: Model-Agnostic Orchestration

## Category

core/orchestration

## When to use

Use this profile when the target project should support more than one orchestrator model, for example Opus primary and ChatGPT fallback.

## Adds to project profile

- primary orchestrator;
- conservative fallback orchestrator;
- pluggable executor (Codex or Claude Code), recorded as `active_executor`;
- executor adapter(s): `AGENTS.md` (Codex) and/or `.claude/skills/executor/` (Claude Code), both materializing `EXECUTOR.md`;
- no-silent-downgrade policy;
- handoff-state tracking;
- model capability matrix.

## Executor rules

The executor must execute only the task packet provided by the current orchestrator.

The executor should not infer whether the orchestrator is Opus or ChatGPT unless the task packet explicitly states mode-specific constraints.

Switching the executor is allowed only at task boundaries and must update `active_executor`.

## Orchestrator rules

All orchestrators must follow `docs/ai/orchestrator/ORCHESTRATOR.md`.

Fallback orchestrators must additionally follow `docs/ai/orchestrator/fallback-policy.md` and update `handoff-state.md`.

## Validation requirements

Fallback mode cannot reduce validation requirements. If validation cannot be run, the task should remain in review or blocked unless the user explicitly accepts residual risk.
