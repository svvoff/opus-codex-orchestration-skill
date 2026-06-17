# Architecture

This repository defines a three-skill system for product discovery and AI-agent delivery.

```text
Project idea / product discussion
  -> project-discovery skill
  -> token-aware product docs + roadmap + backlog
  -> configurator-input.md
  -> opus-codex-configurator skill
  -> ORCHESTRATOR.md / CLAUDE.md / CHATGPT.md / AGENTS.md / validation / execution policy
  -> backlog-driven delivery loop
```

## Skill 1: project-discovery

The first skill turns an ambiguous project idea into structured product context:

- project brief;
- current state;
- staged roadmap;
- epics;
- task cards;
- decisions;
- assumptions;
- compact configurator input.

It asks questions one at a time and avoids writing files until the user confirms the draft.

## Skill 2: opus-codex-configurator

The second skill configures the engineering-agent workflow:

- reads compact upstream product context;
- inspects the target repository in read-only mode;
- composes existing and lazy-created profiles;
- builds validation and risk policy;
- generates Opus and Codex instructions;
- configures backlog-driven execution.

## Skill 3: fallback-orchestrator

A repo-scoped Codex skill (`.codex/skills/fallback-orchestrator/`) that lets Codex CLI host a conservative ChatGPT fallback orchestrator when Opus is unavailable or the task is simple. It reuses the same shared contracts and stays read-only/draft-first, with stricter risk gates than primary mode.

## Shared contracts

All three skills use the same shared contracts for:

- project context;
- roadmap stages;
- backlog indexes;
- epic cards;
- task cards;
- execution state;
- the orchestrator contract (which defines the "do next task" delivery loop);
- the codex executor contract (the executor-side counterpart: stay in scope, report evidence);
- validation evidence;
- context budget.

Changing a shared contract changes the expectations for all three skills.

## Token-aware design

The target repository should not store all product/backlog/execution history in a single huge markdown file. Instead:

- indexes route to the relevant small files;
- active files are read first;
- done/deferred/archive files are read only on demand;
- completed work is summarized in compact ledgers;
- task cards are self-contained enough for execution.


## Model-agnostic orchestration

The generated target-project configuration can support more than one orchestrator:

```text
Primary: Opus orchestrator -> Codex executor
Fallback: ChatGPT orchestrator -> Codex executor
Emergency: Codex-only for trivial scoped tasks
```

The key design choice is to move orchestration behavior into a shared contract:

```text
docs/ai/orchestrator/ORCHESTRATOR.md
```

`CLAUDE.md` becomes the primary-orchestrator wrapper for Opus. `CHATGPT.md` becomes the conservative fallback wrapper. `AGENTS.md` remains the executor contract for Codex.

Fallback mode is intentionally conservative. It can continue low/medium-risk ready tasks, but it should not silently approve high-risk work, roadmap changes, architecture changes, or weaker validation.
