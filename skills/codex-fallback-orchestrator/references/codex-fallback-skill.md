# Codex Fallback Skill Contract

## Purpose

Define how Codex CLI may host a ChatGPT fallback orchestrator mode without collapsing the separation between orchestration, execution, and review.

## Roles

### Primary orchestrator

Normally Opus. Owns product strategy, architecture, high-risk review, and complex planning.

### Fallback orchestrator

ChatGPT/OpenAI model hosted through Codex CLI. Owns conservative continuation when Opus is unavailable or when the user intentionally wants to save Opus tokens on low-risk work.

### Executor

Codex acting in normal executor mode. Implements a provided Codex Task Packet and returns evidence.

## Invariant

The fallback orchestrator must not silently become the executor and reviewer for high-risk work.

For low-risk tasks, a single Codex CLI session may perform both orchestration and execution only if it clearly states:

- selected task;
- scope;
- risk level;
- acceptance criteria;
- validation evidence;
- review decision.

## Supported entrypoints

- `$fallback-orchestrator discuss project ...`
- `$fallback-orchestrator configure target repo ...`
- `$fallback-orchestrator do next simple task`
- `$fallback-orchestrator review execution report ...`

## Required files

In the meta-repo:

- `.codex/skills/fallback-orchestrator/SKILL.md`
- `skills/project-discovery/SKILL.md`
- `skills/opus-codex-configurator/SKILL.md`
- `shared/contracts/orchestrator-contract.md`
- `shared/contracts/target-repository-installation.md`
- `shared/principles/fallback-skill-safety.md`

In the target repo after installation:

- `CHATGPT.md`
- `AGENTS.md`
- `docs/ai/orchestrator/ORCHESTRATOR.md`
- `docs/ai/orchestrator/fallback-policy.md`
- `docs/ai/orchestrator/handoff-state.md`
- `docs/product/current-state.md`
- `docs/product/backlog/index.md`

## Fallback scope levels

### F0 — Discussion

Project discussion, clarification, draft docs. No file writes without approval.

### F1 — Configuration

Read-only inspection and draft configuration. Writes only after approval.

### F2 — Simple delivery

Low-risk ready tasks only. No strategic changes.

### F3 — Blocked/high-risk

Fallback must stop and ask for Opus or human approval.

## Output obligations

Fallback must report:

- mode;
- scope;
- files read;
- assumptions;
- unresolved risks;
- approval needed, if any.
