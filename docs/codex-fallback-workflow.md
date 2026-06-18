# Codex Fallback Workflow

This document explains how to use Codex CLI as a conservative ChatGPT fallback orchestrator when Opus is unavailable or when a task is intentionally simple enough to avoid spending Opus tokens.

## Mental model

The system has three runtime modes:

```text
Primary:   Opus orchestrator   -> executor (Codex or Claude Code)
Fallback:  ChatGPT orchestrator -> executor (Codex or Claude Code)
Emergency: Codex-only for trivial scoped tasks
```

The fallback mode is hosted by Codex CLI through the repo-scoped Codex skill:

```text
.codex/skills/fallback-orchestrator/SKILL.md
```

Use it explicitly:

```text
$fallback-orchestrator обсудим новый проект
$fallback-orchestrator настрой связку для ../my-target-repo
$fallback-orchestrator делай следующую простую задачу
```

## Why this exists

Opus is the preferred orchestrator for complex reasoning, product strategy, architecture, and high-risk review. But Opus can be token-limited or unnecessarily expensive for simple low-risk work.

Fallback mode lets the user continue safely by using a stricter, narrower orchestration contract.

## In the skill repository

Start here when discussing a new project or installing configuration:

```bash
cd opus-codex-orchestration-skill
codex
```

Then call:

```text
$fallback-orchestrator обсудим новый проект: <description>
```

or:

```text
$fallback-orchestrator настрой связку для <path-to-target-repo>
```

The fallback skill should:

1. disclose fallback mode;
2. read the minimum skill/shared contracts;
3. ask one question at a time;
4. generate drafts before writing;
5. ask for target repo path;
6. inspect target repo read-only;
7. create install plan;
8. write only after explicit approval.

## In the target repository

Start here after the project has already been configured:

```bash
cd my-target-repo
codex
```

Then call:

```text
$fallback-orchestrator делай следующую простую задачу
```

The fallback skill should:

1. read `CHATGPT.md`;
2. read `docs/ai/orchestrator/ORCHESTRATOR.md`;
3. read `docs/ai/orchestrator/fallback-policy.md`;
4. read `docs/product/current-state.md`;
5. read `docs/product/backlog/index.md`;
6. choose only a low-risk ready task;
7. read only the selected task card;
8. execute or prepare a Task Packet;
9. require validation evidence;
10. update status docs only after acceptance.

## What fallback may do

Good fallback tasks:

- docs-only updates;
- small task-card/backlog cleanup;
- test-only changes;
- tiny scoped bugfixes;
- generating draft configuration;
- read-only repo inspection;
- simple low-risk task execution.

## What fallback must not do without approval

- high-risk tasks;
- auth;
- payments;
- ads monetization;
- production config;
- migrations;
- secrets;
- data deletion;
- security-sensitive changes;
- release/deploy;
- product pivots;
- architecture rewrites;
- validation weakening.

## Required output header

Fallback should use this header for substantial actions:

```text
Mode: ChatGPT fallback orchestrator
Scope: <discovery | configurator | simple delivery>
Risk posture: conservative
Files read: <short list>
Files intentionally not read: <short list>
Next action: <one sentence>
```

## Safety principle

Fallback should be useful but humble. If a task looks complex or risky, it should stop and request Opus or human approval rather than pushing forward.
