---
id: TASK-001
title: Create basic game shell
status: ready
epic: EPIC-001
priority: P0
risk: low
depends_on: []
validation_profile: [web-build, browser-smoke]
context_refs:
  - docs/product/backlog/epics/active/EPIC-001-core-gameplay.md
---

# TASK-001 — Create Basic Game Shell

## Goal

Create the initial browser game shell with a start screen and game area placeholder.

## Scope

Codex may modify app shell, basic routing/state, and local UI.

## Non-goals

Codex must not modify or add Yandex SDK, ads, analytics, leaderboard, backend, or persistence.

## Acceptance criteria

- [ ] App opens in browser.
- [ ] Start screen is visible.
- [ ] Clicking start enters gameplay placeholder state.
- [ ] No platform SDK integration is added.

## Validation requirements

Required evidence:

- [ ] build command result if available;
- [ ] local browser smoke note;
- [ ] explanation if automated tests do not exist yet.

## Opus review focus

Check no platform or monetization scope creep.
