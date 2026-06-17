# Usage

## 1. Primary workflow with Opus

Start in the skill/meta repository:

```bash
cd opus-codex-orchestration-skill
```

Ask Opus:

```text
Обсудим новый проект: <описание проекта>
```

The `project-discovery` skill should ask one question at a time and produce a reviewable draft of product artifacts.

Then ask:

```text
Настрой связку Opus/ChatGPT + Codex под этот проект.
```

The configurator should ask for the target repository path:

```text
Куда установить конфигурацию связки?
```

After you provide a path, it should inspect the target repo in read-only mode, generate an install plan, show a draft, and write only after explicit approval.

## 2. Fallback workflow through Codex CLI

When Opus tokens are exhausted or the task is intentionally simple, start Codex in this meta-repo:

```bash
cd opus-codex-orchestration-skill
codex
```

Call the repo-scoped fallback skill:

```text
$fallback-orchestrator обсудим новый проект
```

or:

```text
$fallback-orchestrator настрой связку для ../my-target-repo
```

The fallback skill should disclose fallback mode and operate conservatively.

## 3. Work in the configured target repository

After installation:

```bash
cd ../my-target-repo
```

Use Opus primary mode when available:

```text
делай следующую задачу
```

Or use fallback mode for simple low-risk tasks:

```text
$fallback-orchestrator делай следующую простую задачу
```

## 4. What the orchestrator should read

For normal delivery, the orchestrator should read compact files first:

- `docs/product/current-state.md`
- `docs/product/backlog/index.md`
- selected task card
- `docs/ai/execution-state.md`
- `docs/ai/validation/index.md`

It should not read done/deferred/archive folders by default.

## 5. Review this project with Opus

Use:

```text
Ты — Opus primary orchestrator. Провалидируй этот meta-project. Начни с docs/PROJECT_ARCHITECTURE_FOR_OPUS_REVIEW.md и предложи patch plan.
```

Recommended files for Opus to read:

1. `docs/PROJECT_ARCHITECTURE_FOR_OPUS_REVIEW.md`
2. `README.md`
3. `skills/project-discovery/SKILL.md`
4. `skills/opus-codex-configurator/SKILL.md`
5. `.codex/skills/fallback-orchestrator/SKILL.md`
6. `shared/contracts/target-repository-installation.md`
7. `shared/principles/context-budget-policy.md`
8. `shared/principles/fallback-skill-safety.md`
