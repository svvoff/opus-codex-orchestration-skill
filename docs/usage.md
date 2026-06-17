# Usage

## Intended workflow

```text
User asks Opus to configure current repo
        ↓
Opus uses this skill
        ↓
Opus inspects repo in read-only mode
        ↓
Opus produces Repository Inspection Report
        ↓
Opus maps findings to composable profiles
        ↓
Opus drafts missing profiles lazily when needed
        ↓
Opus builds validation model
        ↓
Opus generates configuration draft
        ↓
User reviews and approves
        ↓
Opus writes files to target repo
```

## Example prompt

```text
Use the opus-codex-configurator skill to configure this repository.
I want Opus to act as orchestrator and reviewer, and Codex to act as executor.
Validation is very important. Start by inspecting the repo yourself.
```

## Expected generated files in target repo

```text
CLAUDE.md
AGENTS.md
docs/ai/validation.md
docs/ai/codex-task-template.md
docs/ai/codex-report-template.md
docs/ai/review-checklist.md
docs/ai/escalation-policy.md
```

## Important behavior

The skill must not write generated files immediately. It first produces a draft for review. Files are written only after the user explicitly confirms.
