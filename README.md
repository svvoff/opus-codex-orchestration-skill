# Opus-Codex Orchestration Skill

A Claude/Opus skill for configuring an **Opus orchestrator + Codex executor** workflow for a target git repository.

The skill is designed to be used from inside Claude Code / Opus. It inspects the target repository in read-only mode, asks one question at a time, builds a validation-first project profile, and generates a reviewable configuration draft before writing anything.

## Core idea

```text
Opus = orchestrator / architect / reviewer
Codex = executor / patch-maker / test-runner
```

This repository contains the reusable skill that helps create project-specific files such as:

```text
CLAUDE.md
AGENTS.md
docs/ai/validation.md
docs/ai/codex-task-template.md
docs/ai/codex-report-template.md
docs/ai/review-checklist.md
docs/ai/escalation-policy.md
```

## Design principles

- Inspect the repository before asking detailed questions.
- Keep inspection read-only.
- Ask one question at a time.
- Generate configuration drafts before writing files.
- Use composable profiles instead of large stack-specific templates.
- Create missing profiles lazily when a new stack appears.
- Treat validation evidence as mandatory.
- Distinguish repository facts, assumptions, questions, and decisions.

## Repository layout

```text
skills/opus-codex-configurator/
  SKILL.md
  resources/
    inspection/
    composition/
    profiles/
      core/
      risk-areas/
      validation/
    templates/
docs/
examples/
scripts/
```

## Usage

1. Add this skill repository to the environment where you use Claude/Opus.
2. Open the target git project in Claude Code.
3. Invoke the skill with a request such as:

```text
Use the opus-codex-configurator skill to configure this repository for Opus orchestrator + Codex executor.
```

4. Let Opus inspect the repo.
5. Review the generated draft.
6. Approve writing files only after the draft looks correct.

See [`docs/usage.md`](docs/usage.md) for a fuller walkthrough.
