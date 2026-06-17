# Target Repository Workflow

This repository is a meta-repository. It contains reusable skills, templates, contracts, and examples.

The real project lives in a separate target repository.

## Canonical flow

### Phase 1 — Work in the skill repository

```bash
cd opus-codex-orchestration-skill
```

Use Opus primary mode or Codex fallback mode to discuss the project:

```text
Обсудим новый проект: игра на Яндекс Игры.
```

The `project-discovery` skill should create draft product artifacts:

- project brief;
- current state;
- roadmap index and stages;
- backlog index;
- epic cards;
- task cards;
- decisions;
- assumptions;
- configurator input.

### Phase 2 — Choose target repository

The skill must ask:

```text
Куда установить конфигурацию связки? Укажи путь к целевому git-репозиторию.
```

The user provides a path, for example:

```text
../my-yandex-game
```

### Phase 3 — Inspect target repo

The configurator performs read-only inspection:

- repo shape;
- stack;
- package manager;
- existing tests;
- build commands;
- lint/typecheck commands;
- CI;
- existing `CLAUDE.md`, `CHATGPT.md`, `AGENTS.md`, `docs/product`, `docs/ai`;
- risk areas.

No files are written during inspection.

### Phase 4 — Draft install plan

The configurator shows:

- target path;
- files to create;
- files to modify;
- files to preserve;
- conflicts/overwrites;
- assumptions;
- validation model;
- approval question.

### Phase 5 — Write after approval

Only after explicit approval, write files into the target repo.

Typical target repo output:

```text
CLAUDE.md
CHATGPT.md
AGENTS.md

docs/product/
  project-brief.md
  configurator-input.md
  current-state.md
  assumptions.md
  roadmap/
  backlog/
  decisions/

docs/ai/
  execution-state.md
  current-context.md
  orchestrator/
  validation/
  execution-log/
```

### Phase 6 — Work in the target repo

```bash
cd ../my-yandex-game
```

Then use:

```text
делай следующую задачу
```

The orchestrator should read compact context/index files, choose the next ready task, delegate to Codex, validate the result, and update status docs.

## Important boundary

The skill repo is not the long-term source of truth for real project backlog/status after installation.

After installation, the target repo owns its own product docs, AI docs, backlog, roadmap, and execution state.
