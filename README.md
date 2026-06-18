# Opus/Codex Orchestration Skill System

This is a **meta-repository** for configuring AI-assisted delivery workflows in real target git repositories.

It is not the app/game/backend being built. It is the reusable skill system used to discuss a project, generate product context, configure agents, and install the resulting workflow into a separate target repository.

## Core runtime model

```text
Primary:   Opus orchestrator   -> executor (Codex or Claude Code)
Fallback:  ChatGPT orchestrator -> executor (Codex or Claude Code)
Emergency: Codex-only for trivial scoped tasks
```

## What this project does

The system has three skill layers:

```text
1. project-discovery
   Discusses the real project, product goals, MVP, roadmap, epics, backlog, risks, and validation goals.

2. opus-codex-configurator
   Inspects the target repository and generates project-specific Opus/ChatGPT/Codex configuration.

3. fallback-orchestrator
   A Codex skill that lets Codex CLI host a conservative ChatGPT fallback orchestrator when Opus is unavailable or when the task is simple.
```

The intended result is a configured target repository where the user can say:

```text
делай следующую задачу
```

and the orchestrator will choose the next ready task, delegate to the executor, validate the result, update docs/status, and report back.

## Canonical workflow

### Phase 1 — Work in this skill/meta repository

```bash
cd opus-codex-orchestration-skill
```

Use Opus primary mode, or Codex fallback mode if Opus is unavailable:

```text
Обсудим новый проект: игра на Яндекс Игры.
```

The `project-discovery` skill creates draft product artifacts:

- project brief;
- current state;
- roadmap;
- backlog;
- epics;
- task cards;
- decisions;
- assumptions;
- configurator input.

### Phase 2 — Choose target repository

The configurator must ask where to install the generated workflow:

```text
Куда установить конфигурацию связки? Укажи путь к целевому git-репозиторию.
```

Example:

```text
../my-yandex-game
```

### Phase 3 — Configure target repository

The configurator:

1. inspects the target repo in read-only mode;
2. reads upstream product context;
3. infers required profiles;
4. creates missing profiles lazily as drafts;
5. generates an install plan;
6. generates a reviewable configuration draft;
7. writes files only after explicit approval.

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

### Phase 4 — Work in the target repository

```bash
cd ../my-yandex-game
```

Then use:

```text
делай следующую задачу
```

The configured orchestrator reads compact index/current-state files, picks the next ready task, creates a Task Packet, reviews the executor.s output, requires validation evidence, and updates status docs.

## Fallback usage

When Opus tokens are exhausted, or when the work is intentionally simple, use the repo-scoped Codex skill:

```text
$fallback-orchestrator обсудим новый проект
$fallback-orchestrator настрой связку для ../target-repo
$fallback-orchestrator делай следующую простую задачу
```

Fallback mode is conservative. It should not silently replace Opus for high-risk strategy, architecture, security, production, payments, ads monetization, migrations, secrets, or data deletion work.

## Design principles

- Skill repo and target repo are separate.
- Inspect repositories before asking detailed technical questions.
- Keep inspection read-only.
- Ask one question at a time.
- Draft before writing.
- Write only after explicit approval.
- Use composable profiles instead of huge stack-specific templates.
- Create missing profiles lazily.
- Treat validation evidence as mandatory.
- Use token-aware reading: index first, archive by default.
- Keep Opus for strategic/high-risk work.
- Use ChatGPT fallback for conservative continuation.
- The executor is pluggable (Codex or Claude Code); switch only at task boundaries.

## Repository layout

```text
.claude/
  skills/                       # symlinks that make the Opus skills discoverable by Claude Code
    project-discovery -> ../../skills/project-discovery
    opus-codex-configurator -> ../../skills/opus-codex-configurator

.codex/
  skills/
    fallback-orchestrator/      # Codex-hosted fallback skill
      SKILL.md

skills/                         # skill sources (linked into .claude/skills/)
  project-discovery/
    SKILL.md
    resources/templates/

  opus-codex-configurator/
    SKILL.md
    resources/
      inspection/
      composition/
      profiles/
      templates/

shared/
  contracts/
  principles/
  vocabulary/

docs/
  PROJECT_ARCHITECTURE_FOR_OPUS_REVIEW.md
  target-repo-workflow.md
  codex-fallback-workflow.md
  token-aware-design.md
  model-agnostic-orchestration.md
  architecture.md
  usage.md

examples/
  yandex-games-mvp/
```

## For Opus review

The most important file for a high-level Opus validation pass is:

```text
docs/PROJECT_ARCHITECTURE_FOR_OPUS_REVIEW.md
```

Suggested request:

```text
Ты — Opus primary orchestrator. Провалидируй этот meta-project как систему для настройки Opus/ChatGPT orchestrator + Codex executor под реальные git-проекты. Начни с docs/PROJECT_ARCHITECTURE_FOR_OPUS_REVIEW.md и предложи patch plan.
```

## Key docs

- [`docs/PROJECT_ARCHITECTURE_FOR_OPUS_REVIEW.md`](docs/PROJECT_ARCHITECTURE_FOR_OPUS_REVIEW.md)
- [`docs/target-repo-workflow.md`](docs/target-repo-workflow.md)
- [`docs/codex-fallback-workflow.md`](docs/codex-fallback-workflow.md)
- [`docs/token-aware-design.md`](docs/token-aware-design.md)
- [`docs/model-agnostic-orchestration.md`](docs/model-agnostic-orchestration.md)
