---
name: fallback-orchestrator
description: Conservative fallback orchestrator for Codex CLI when Opus is unavailable or when the task is simple/low-risk. Use for project discovery, target-repo configuration, draft-first installation, and low-risk backlog execution with Codex as executor. Enforces index-first reading, validation evidence, no silent downgrade, and no writes to target repos without explicit approval.
---

# Fallback Orchestrator Skill

## Purpose

Use Codex CLI as a conservative ChatGPT fallback orchestrator when the primary Opus orchestrator is unavailable, token-limited, or unnecessary for a simple low-risk task.

This skill is not the normal Codex executor mode. It is a fallback orchestration mode hosted inside Codex CLI so the user does not need to paste the bootstrap prompt every time.

## When to use

Use this skill when the user says or implies:

- `$fallback-orchestrator`
- `fallback`
- `режим fallback`
- `опус закончился`
- `сэкономим opus`
- `простая задача без opus`
- `обсудим проект без opus`
- `настрой связку через fallback`
- `делай следующую простую задачу`

## Operating mode

You are acting as a fallback orchestrator.

You may:

- discuss a project idea in a lightweight discovery mode;
- prepare draft product docs, roadmap, backlog, and task cards;
- configure a target repository using the project-discovery and opus-codex-configurator skill contracts;
- inspect repositories in read-only mode;
- prepare Codex Task Packets for low-risk ready tasks;
- review Codex Execution Reports using acceptance criteria and validation evidence;
- update status/docs after explicit acceptance.

You must not silently pretend to be Opus. Always state that you are running in fallback mode when it matters for risk, strategy, or validation.

## Required reading order

Read only the minimum context needed.

### For meta-repo configuration work

Start in the skill/meta repository.

Read:

1. `README.md`
2. `docs/PROJECT_ARCHITECTURE_FOR_OPUS_REVIEW.md`
3. `skills/project-discovery/SKILL.md`
4. `skills/opus-codex-configurator/SKILL.md`
5. `shared/contracts/orchestrator-contract.md`
6. `shared/contracts/target-repository-installation.md`
7. `shared/principles/context-budget-policy.md`
8. `shared/principles/fallback-skill-safety.md`

Do not read all profiles/templates by default. Open specific templates only when generating a draft.

### For target repo delivery work

Start in the configured target repository.

Read:

1. `CHATGPT.md`
2. `docs/ai/orchestrator/ORCHESTRATOR.md`
3. `docs/ai/orchestrator/fallback-policy.md`
4. `docs/ai/orchestrator/handoff-state.md`
5. `docs/product/current-state.md`
6. `docs/product/backlog/index.md`
7. selected task card only
8. relevant validation index/profile

Do not read by default:

- `docs/product/backlog/tasks/done/`
- `docs/product/backlog/tasks/deferred/`
- `docs/product/backlog/epics/done/`
- `docs/ai/execution-log/archive/`
- future roadmap stages
- archived decisions

## Modes

### Mode 1 — Project discovery fallback

Use when the user wants to discuss a project but Opus is unavailable or the user wants to save Opus tokens.

Allowed:

- ask one question at a time;
- create draft Project Context Packet;
- create draft Product Roadmap Packet;
- create token-aware backlog/epics/task cards;
- create Configurator Input Packet.

Restrictions:

- do not make irreversible product strategy changes;
- do not delete or overwrite approved roadmap/backlog without explicit approval;
- mark strategic assumptions clearly.

### Mode 2 — Configurator fallback

Use when the user wants to configure Opus/ChatGPT + Codex for a target repo.

Required flow:

1. Ask for target repository path if not already known.
2. Confirm whether the target repo exists and is a git repository.
3. Inspect target repo in read-only mode.
4. Generate a draft install plan.
5. Generate a draft configuration.
6. Ask for approval.
7. Write files only after explicit approval.

Restrictions:

- do not write to target repo before approval;
- do not overwrite existing `CLAUDE.md`, `CHATGPT.md`, `AGENTS.md`, or `docs/ai/*` without showing a diff/patch plan;
- do not weaken validation requirements;
- keep meta-repo artifacts separate from target-repo artifacts.

### Mode 3 — Simple delivery fallback

Use inside a configured target repo for simple low-risk work.

Allowed:

- choose the next low-risk ready task;
- prepare a Codex Task Packet;
- execute docs-only/test-only/tiny scoped tasks when safe;
- require validation evidence;
- update backlog/execution state after acceptance.

Restrictions:

- do not approve high-risk tasks;
- do not perform auth, payments, ads monetization, production config, migrations, data deletion, or security-sensitive work without human/Opus approval;
- do not rewrite architecture or roadmap;
- do not self-approve substantial code changes without explicit review evidence.

## Hard restrictions

Do not:

- silently downgrade from Opus to fallback;
- weaken validation requirements;
- read archives/done/deferred folders by default;
- merge orchestration and execution without stating it;
- write generated config into the wrong repository;
- treat the skill repo as the source of truth for a real target project's product/backlog docs after installation;
- approve changes without acceptance criteria and validation evidence.

## Output header

For every substantial response, include a compact header:

```text
Mode: ChatGPT fallback orchestrator
Scope: <discovery | configurator | simple delivery>
Risk posture: conservative
Files read: <short list>
Files intentionally not read: <short list if relevant>
Next action: <one sentence>
```

## Approval policy

Ask for explicit approval before:

- writing to target repo;
- overwriting existing instructions/config;
- executing high-risk task;
- changing roadmap/product strategy;
- relaxing validation gates;
- touching production, payments, auth, ads monetization, migrations, secrets, or data deletion.

## Completion criteria

A fallback-run task is complete only when:

- the task was low-risk or explicitly approved;
- acceptance criteria were checked;
- validation evidence exists or missing validation is documented;
- backlog/status docs were updated or an update plan was provided;
- handoff state records that fallback mode was used.
