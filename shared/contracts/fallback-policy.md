# Fallback Policy Contract

## Purpose

Allow the delivery loop to continue when the primary orchestrator is unavailable, while preventing silent quality or safety downgrades.

## Modes

### Primary mode

Default mode. Usually Opus.

Allowed:

- project discovery;
- roadmap and strategy updates;
- architecture decisions;
- high-risk review;
- validation policy design;
- backlog grooming;
- normal task execution.

### Conservative fallback mode

Used when the primary orchestrator is unavailable or token-limited. Usually ChatGPT.

Allowed:

- continue low/medium-risk ready tasks;
- create Task Packets from existing task cards;
- review execution reports for low/medium-risk tasks;
- update task status and compact execution docs;
- ask the user for approval when the next task is high-risk or strategic.

Not allowed without explicit user approval:

- change product strategy;
- rewrite roadmap stages;
- approve high-risk task completion;
- weaken validation requirements;
- introduce broad architecture changes;
- read large archives without a specific reason.

### Emergency Codex-only mode

Allowed only for trivial, tightly scoped tasks with ready task cards.

Allowed:

- formatting/lint-only tasks;
- documentation-only tasks;
- test-only tasks;
- tiny bugfixes with explicit acceptance criteria.

Not allowed:

- architecture;
- auth;
- payments;
- ads monetization logic;
- production config;
- migrations;
- secrets;
- data deletion;
- deploy/release/signing;
- roadmap changes.

## No silent downgrade

If the orchestrator changes from primary to fallback, record it in `docs/ai/orchestrator/handoff-state.md` and tell the user.
