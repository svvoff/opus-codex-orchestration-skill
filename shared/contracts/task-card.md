# Contract: Task Card

Recommended paths:

```text
docs/product/backlog/tasks/ready/TASK-001-name.md
docs/product/backlog/tasks/in-progress/TASK-001-name.md
docs/product/backlog/tasks/done/YYYY-MM/TASK-001-name.md
```

## Required front matter

```yaml
id: TASK-001
title: Example task
status: ready
epic: EPIC-001
priority: P0
risk: low
depends_on: []
validation_profile: []
context_refs: []
```

## Required sections

- Goal
- Context
- Scope
- Non-goals
- Acceptance criteria
- Validation requirements
- Codex allowed areas
- Codex forbidden areas
- Opus review focus
- Documentation updates required

## Rule

A ready task must be self-contained enough for Opus to create a Task Packet without reading the whole roadmap.
