# Project Architecture for Opus Review

## Purpose of this document

This document is a detailed architectural brief for Opus or another strong orchestrator to review, critique, and improve this meta-project.

The project is intended to become a reusable skill system for configuring an AI-assisted delivery workflow around:

```text
Primary:   Opus orchestrator   -> Codex executor
Fallback:  ChatGPT orchestrator -> Codex executor
Emergency: Codex-only for trivial scoped tasks
```

The user wants Opus to validate whether the current design is coherent, safe, token-efficient, and suitable for complex real projects.

## Executive summary

This repository is a meta-repository, not an application repository.

It contains skills, shared contracts, principles, vocabularies, templates, and examples used to configure another real target repository.

The intended flow is:

```text
1. User enters this skill/meta repository.
2. User discusses a real project idea.
3. Project Discovery skill produces product context, roadmap, backlog, epics, and first tasks.
4. Configurator skill asks where the target repository is.
5. Configurator inspects the target repository in read-only mode.
6. Configurator generates a reviewable configuration draft.
7. User approves.
8. Configurator writes AI/product docs and agent config into the target repository.
9. User switches to the target repository.
10. User says: "делай следующую задачу".
11. Orchestrator chooses the next ready task, delegates to Codex, validates the result, updates docs/status, and reports back.
```

The project emphasizes:

- separation between meta-repo and target repo;
- separation between orchestrator and executor;
- validation-first execution;
- token-aware context usage;
- lazy composable profiles;
- fallback orchestration when Opus is unavailable;
- backlog-driven delivery.

## Core goals

### Goal 1 — Product discovery before engineering configuration

The system should help the user discuss a real project before configuring agents.

Examples:

- game for Yandex Games;
- iOS application;
- TypeScript SaaS;
- mobile app;
- backend system;
- monorepo.

The output should not be only a prompt. It should become structured project knowledge:

- project brief;
- current state;
- roadmap;
- backlog;
- epics;
- task cards;
- assumptions;
- decisions;
- validation goals;
- configurator input.

### Goal 2 — Configure an AI delivery system for the target project

The system should generate project-specific configuration for:

- Opus as primary orchestrator;
- ChatGPT as conservative fallback orchestrator;
- Codex as executor;
- Codex-only mode for trivial tasks.

Generated files should include, at minimum:

- `CLAUDE.md`;
- `CHATGPT.md`;
- `AGENTS.md`;
- `docs/ai/orchestrator/ORCHESTRATOR.md`;
- `docs/ai/orchestrator/fallback-policy.md`;
- `docs/ai/orchestrator/handoff-state.md`;
- `docs/ai/validation/index.md`;
- `docs/ai/execution-state.md`;
- `docs/product/*`.

### Goal 3 — Enable backlog-driven execution

After configuration, the user should be able to enter the target repo and say:

```text
делай следующую задачу
```

The orchestrator should:

1. read compact current/index files;
2. choose the next ready task;
3. check dependencies and risk;
4. form a Codex Task Packet;
5. delegate implementation to Codex;
6. review Codex Execution Report;
7. require validation evidence;
8. update backlog/status/docs;
9. report results.

### Goal 4 — Reduce Opus token usage

The system should avoid forcing Opus to read the entire backlog, roadmap, completed tasks, and execution history.

Token-aware principles:

- read index files first;
- read current-state before full history;
- read selected task card only;
- archive done/deferred work;
- keep compact ledgers;
- avoid reading archives unless needed;
- split backlog/roadmap/decisions into small files.

### Goal 5 — Support fallback when Opus is unavailable

When Opus tokens are exhausted or the task is simple, the user should be able to call a Codex-hosted fallback skill:

```text
$fallback-orchestrator
```

Fallback should be conservative:

- good for docs, tests, tiny scoped tasks, draft config, backlog grooming;
- not trusted for high-risk approval, architecture rewrites, major product pivots, validation weakening.

## Repository structure

Current intended structure:

```text
opus-codex-orchestration-skill/
  README.md

  .codex/
    skills/
      fallback-orchestrator/
        SKILL.md
        references/
        templates/

  skills/
    project-discovery/
      SKILL.md
      resources/
        templates/

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
    architecture.md
    usage.md
    target-repo-workflow.md
    token-aware-design.md
    codex-fallback-workflow.md
    model-agnostic-orchestration.md
    PROJECT_ARCHITECTURE_FOR_OPUS_REVIEW.md

  examples/
    yandex-games-mvp/
```

## Skill 1 — Project Discovery

### Responsibility

The `project-discovery` skill converts an ambiguous project idea into structured product context and a token-aware execution backlog.

It should behave like a product strategist, requirements analyst, and roadmap planner.

### Inputs

- user description of a project;
- optional existing repo or docs;
- constraints, goals, target platform, business model, timeline.

### Outputs

Project-specific artifacts intended for the target repository:

```text
docs/product/
  project-brief.md
  current-state.md
  configurator-input.md
  assumptions.md
  roadmap/
    index.md
    stages/
  backlog/
    index.md
    epics/
    tasks/
  decisions/
```

### Behavioral rules

- ask one question at a time;
- distinguish facts, assumptions, decisions, and open questions;
- create roadmap beyond MVP, but keep MVP from being overbuilt;
- create backlog and task cards that can become Codex Task Packets;
- use token-aware file structure;
- do not write into target repo without approval.

### Roadmap philosophy

Roadmap should be stage-based, not fake calendar-based.

Example stages:

- Discovery / concept;
- MVP;
- validation / soft launch;
- public launch;
- retention improvement;
- monetization expansion;
- scale / live operations.

Roadmap should contain:

- hypotheses;
- exit criteria;
- success metrics;
- non-goals;
- future technical pressure.

### Backlog philosophy

The backlog should be executable, not just aspirational.

Each task card should include:

- ID;
- title;
- status;
- epic;
- priority;
- risk;
- dependencies;
- scope;
- non-goals;
- acceptance criteria;
- validation requirements;
- allowed/forbidden areas;
- Opus/ChatGPT review focus.

## Skill 2 — Opus/Codex Configurator

### Responsibility

The `opus-codex-configurator` skill configures an AI delivery workflow for a real target repository.

It consumes:

- product discovery output;
- target repository facts;
- shared contracts and principles;
- lazy composable profiles.

It produces:

- orchestrator/executor configuration;
- validation policy;
- fallback policy;
- task/report templates;
- execution policy;
- target repo install plan.

### Required flow

1. Ask for target repository path if unknown.
2. Inspect target repo in read-only mode.
3. Build repository facts report.
4. Read upstream product context using token-aware policy.
5. Infer required profiles.
6. Create missing profiles lazily as drafts.
7. Compose rules by precedence.
8. Generate draft configuration.
9. Ask for approval.
10. Write files only after approval.

### Target repository separation

The configurator must not confuse:

```text
skill repo = reusable skills/contracts/templates

target repo = real project config/backlog/execution state
```

The target repo path is mandatory before installation.

If target repo does not exist, produce a draft package only.

### Lazy composable profiles

The configurator should not ship a giant up-front catalog of all stacks.

Instead, it should maintain a small kernel and create profiles lazily:

- platform profiles;
- language profiles;
- UI/framework profiles;
- integration profiles;
- risk profiles;
- validation profiles;
- repo-shape profiles.

Prefer composable modules like:

```text
platforms/ios.md
ui/swiftui.md
integrations/firebase.md
payments/revenuecat.md
validation/xcode.md
```

over huge combined profiles like:

```text
ios-swiftui-firebase-revenuecat.md
```

Combined profiles are allowed only when the combination has unique reusable behavior not captured by atomic modules.

### Rule precedence

When composing profiles:

```text
user instructions
> project-specific rules
> risk-area profiles
> integration profiles
> framework profiles
> language profiles
> platform profiles
> generic defaults
```

More specific and more restrictive rules should win.

Safety rules win over convenience rules.

## Skill 3 — Codex Fallback Orchestrator

### Responsibility

The `fallback-orchestrator` skill lets Codex CLI host a conservative ChatGPT fallback orchestrator.

This reduces repeated bootstrap prompting when Opus is unavailable.

### Entrypoints

```text
$fallback-orchestrator обсудим новый проект
$fallback-orchestrator настрой связку для ../target-repo
$fallback-orchestrator делай следующую простую задачу
```

### Modes

#### Discovery fallback

Allowed:

- lightweight project discussion;
- draft context/roadmap/backlog;
- ask one question at a time.

Not allowed without approval:

- product pivots;
- deleting approved roadmap;
- rewriting business model.

#### Configurator fallback

Allowed:

- read skill/shared contracts;
- ask target path;
- inspect target repo read-only;
- generate draft install plan;
- write after approval.

Not allowed:

- write without approval;
- overwrite config silently;
- weaken validation.

#### Simple delivery fallback

Allowed:

- choose next low-risk ready task;
- prepare/execute task packet;
- review evidence;
- update status docs after acceptance.

Not allowed:

- high-risk approval;
- auth/payments/ads monetization/production/migrations/secrets/data deletion/security/release/deploy;
- architecture rewrite;
- roadmap rewrite.

## Shared contracts

### Orchestrator Contract

Defines responsibilities of any orchestrator:

- choose tasks;
- maintain context budget;
- form task packets;
- enforce risk gates;
- review executor output;
- update status docs;
- preserve validation requirements.

### Codex Executor Contract

The executor-side counterpart of the Orchestrator Contract. Defines Codex's hard constraints as executor:

- execute only the provided task packet; never select or re-scope;
- respect allowed/forbidden areas; stop and report if a change would touch a forbidden area;
- mandatory report fields (changed files, commands, results, validation evidence, scope check, risks, incomplete items);
- no self-direction, no roadmap/architecture decisions, no validation weakening;
- escalate on ambiguity instead of guessing.

The generated `AGENTS.md` is the per-project materialization of this contract.

### Target Repository Installation Contract

Defines safe installation flow:

- ask target path;
- verify path;
- inspect read-only;
- create install plan;
- draft before write;
- preserve existing files;
- write only after approval.

### Codex Fallback Skill Contract

Defines how Codex CLI may host fallback orchestration without losing role separation.

### Delivery Loop

The "do next task" runtime cycle — trigger phrases, executor expectations, and completion criteria — is part of the Orchestrator Contract above, not a separate file.

### Task Card Contract

Defines execution-ready task cards.

### Backlog Index Contract

Defines small routing file for task selection.

### Execution State Contract

Defines compact current execution state.

### Validation Evidence Contract

Defines evidence expected before acceptance.

## Token-aware design

### Problem

If Opus reads the entire roadmap, backlog, done tasks, execution logs, and decisions on each run, token usage explodes.

### Solution

Use filesystem routing and read policies.

Canonical target repo structure:

```text
docs/product/
  current-state.md
  configurator-input.md
  roadmap/
    index.md
    stages/
    archive/
  backlog/
    index.md
    epics/
      active/
      blocked/
      done/
      deferred/
    tasks/
      ready/
      in-progress/
      blocked/
      done/
      deferred/
  decisions/
    index.md
    active/
    archive/

docs/ai/
  execution-state.md
  current-context.md
  validation/
    index.md
  execution-log/
    latest.md
    archive/
```

### Default read policy

For “do next task”, the read set is defined once in the canonical
`shared/principles/context-budget-policy.md` (Tier 0 delivery-loop read set + the
selected task card, plus referenced epic/decision only when needed).

Do not read by default:

- done tasks;
- deferred tasks;
- future roadmap stages;
- archived decisions;
- archived execution logs.

### Done/archive policy

Completed tasks move to:

```text
docs/product/backlog/tasks/done/YYYY-MM/
```

Completed epics move to:

```text
docs/product/backlog/epics/done/
```

Execution logs should be compact:

```text
docs/ai/execution-log/latest.md
```

with old logs summarized in monthly archives.

## Validation-first design

The system should treat validation as a first-class architecture component.

A task is not done because Codex says it is done.

A task is done only when:

- acceptance criteria are satisfied;
- validation evidence exists;
- forbidden areas were not touched;
- scope stayed controlled;
- orchestrator accepted the result;
- status/docs were updated.

Validation ladder:

- L0: formatting/lint/typecheck/build;
- L1: unit tests;
- L2: integration tests;
- L3: e2e/system tests;
- L4: domain-specific checks;
- L5: human/Opus approval gates.

Fallback mode should require more, not less, evidence.

## Model-agnostic orchestration

The project should avoid hard-coding all orchestration behavior into `CLAUDE.md`.

Instead:

- `ORCHESTRATOR.md` holds model-independent orchestration rules;
- `CLAUDE.md` adapts those rules for Opus;
- `CHATGPT.md` adapts them for conservative fallback;
- `AGENTS.md` instructs Codex executor mode.

This enables:

```text
Opus primary orchestrator
ChatGPT fallback orchestrator
Codex executor
Codex-only emergency mode
```

without duplicating the entire workflow in each model-specific file.

## Key risks to validate

### Risk 1 — Too much complexity

The project may become too heavy before the core loop is proven.

Questions for Opus:

- Is the separation into two main skills plus fallback skill justified?
- Are there too many contracts for an MVP?
- Which files are essential for v1?
- Which can be postponed?

### Risk 2 — Fallback overreach

Codex-hosted fallback may start making decisions that should belong to Opus.

Questions for Opus:

- Are fallback restrictions strong enough?
- Should fallback be allowed to execute code changes in the same session?
- Should high-risk tasks always require explicit human approval?

### Risk 3 — Token-aware design becomes stale

Index files may get out of sync with task files.

Questions for Opus:

- Should the system include consistency checks?
- Should task moves be accompanied by mandatory index updates?
- Should there be a validation command/script for docs consistency later?

### Risk 4 — Target repo writes are unsafe

Configurator may overwrite user files or write to wrong path.

Questions for Opus:

- Is the install plan detailed enough?
- Should patch mode be mandatory for existing repos?
- Should writes require git clean status?

### Risk 5 — Self-review

Codex may act as fallback orchestrator and executor in one session.

Questions for Opus:

- When is single-session fallback acceptable?
- Should the skill require a separate review turn for any code change?
- Should docs-only/test-only be the only single-session tasks?

### Risk 6 — Validation gaps

For early projects, automated validation may not exist yet.

Questions for Opus:

- How should manual validation be documented?
- Should creating validation infrastructure be one of the earliest backlog tasks?
- What minimum evidence is acceptable for MVP prototypes?

## Desired Opus review output

When Opus reviews this project, it should produce:

1. Architecture verdict.
2. Simplification recommendations.
3. Safety/risk recommendations.
4. Token-efficiency recommendations.
5. Missing contracts/templates.
6. Suggested changes to skill behavior.
7. Suggested MVP cut of the meta-project.
8. Patch plan for files to modify.

## Proposed review prompt for Opus

```text
Ты — Opus primary orchestrator. Провалидируй этот meta-project как систему для настройки Opus/ChatGPT orchestrator + Codex executor под реальные git-проекты.

Прочитай:
1. docs/PROJECT_ARCHITECTURE_FOR_OPUS_REVIEW.md
2. README.md
3. skills/project-discovery/SKILL.md
4. skills/opus-codex-configurator/SKILL.md
5. .codex/skills/fallback-orchestrator/SKILL.md
6. shared/contracts/orchestrator-contract.md
7. shared/contracts/target-repository-installation.md
8. shared/principles/context-budget-policy.md
9. shared/principles/fallback-skill-safety.md

Задачи ревью:
- найди архитектурные противоречия;
- предложи упрощения;
- проверь безопасность fallback режима;
- проверь token-aware дизайн;
- проверь разделение skill repo и target repo;
- предложи изменения в файлах;
- не переписывай всё без необходимости;
- дай patch plan.
```

## MVP cut (v1 essentials)

The core loop — "discuss a project → configure a target repo → do next task" — must be
proven end-to-end once before the meta-project grows further. The following is the v1
cut. Nothing here is deleted; deferred items are kept but marked post-v1.

**Core (needed to run the loop once):**

- Skills: `project-discovery`, `opus-codex-configurator`, `fallback-orchestrator`.
- Contracts: `orchestrator-contract`, `codex-executor-contract`, `task-card`, `backlog-index`, `execution-state`, `validation-evidence`, `target-repository-installation`, `project-context-packet`, `configurator-input-packet`.
- Principles: `context-budget-policy`, `draft-first-write-after-approval`, `evidence-based-validation`, `conservative-fallback-mode`, `no-silent-downgrade`.
- Vocabulary: `task-statuses`, `risk-taxonomy`, `validation-levels`.

**Deferred until after the first proven run (post-v1):**

- Contracts: `epic-card`, `product-roadmap-packet`, `orchestrator-handoff-state`, `current-context`, `execution-log`, `model-capability-matrix`, `codex-fallback-skill`, `fallback-policy`.
- Principles: `archive-by-default`, `compact-ledgers`, `current-state-over-full-history`, `future-aware-not-future-built`, `index-first-reading`, `backlog-driven-execution`, `model-agnostic-orchestration` (several are philosophy docs that restate each other — candidates for merging later).
- Vocabulary: `roadmap-stages`, `requirement-levels`.

**Stance:** do not add new contracts or principles until the core loop has run end-to-end at least once. After that run, revisit the deferred set and merge overlapping philosophy docs rather than adding more.

**v1 amendment — `codex-executor-contract` promoted into Core.** This is a deliberate exception to the stance above, not a drift from it. The executor is the safety lynchpin of the orchestrator/executor split: the whole model relies on Codex executing only the task packet, staying in scope, and reporting evidence. Leaving the executor as a 4-line subsection while the orchestrator has a first-class contract is an asymmetry in the most safety-critical role. The contract consolidates material that already existed (`AGENTS.md.template`, the "Executor expectations" subsection of `orchestrator-contract`, and `codex-report-template`) rather than adding net-new scope — so it does not trigger the growth the stance guards against. No other contract is promoted; the deferred set stands.

## Current architectural stance

The project should remain practical:

- start with markdown contracts and skills;
- avoid building a SaaS/CLI application initially;
- use lazy profiles rather than huge upfront template libraries;
- keep validation central;
- keep fallback useful but constrained;
- make “do next task” work from small, local, structured docs.
