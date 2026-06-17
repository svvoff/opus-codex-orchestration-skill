# Target Repository Installation Contract

## Purpose

Define the safe process for generating configuration in the skill/meta repository and installing it into a separate target project repository.

## Repository roles

### Skill repository

Contains reusable skills, shared contracts, templates, examples, and principles.

Examples:

- `skills/project-discovery/`
- `skills/opus-codex-configurator/`
- `.codex/skills/fallback-orchestrator/`
- `shared/contracts/`
- `shared/principles/`

The skill repository is not the source of truth for a real project's backlog after installation.

### Target repository

Contains the actual product/project being built.

After installation, it owns:

- `CLAUDE.md`
- `CHATGPT.md`
- `AGENTS.md`
- `docs/product/*`
- `docs/ai/*`

## Required flow

1. Ask for target repo path.
2. Verify the path.
3. Check whether it is a git repository.
4. Inspect it in read-only mode.
5. Detect existing AI/product docs.
6. Generate an install plan.
7. Generate a reviewable draft.
8. Ask for explicit approval.
9. Write files only after approval.
10. Report exactly what was written.

## Path handling

The user may provide:

- an absolute path;
- a relative path from the skill repo;
- a future path for a repo that does not exist yet.

If the target path does not exist, produce a draft package but do not claim installation succeeded.

## Existing files policy

If the target repo already contains any of these files:

- `CLAUDE.md`
- `CHATGPT.md`
- `AGENTS.md`
- `docs/product/*`
- `docs/ai/*`

then the configurator must:

- read the existing files relevant to the install;
- preserve user-authored content when possible;
- show a patch/diff plan;
- ask for approval before overwriting.

## Install plan format

The install plan must list:

- target path;
- files to create;
- files to modify;
- files to preserve;
- files requiring merge/diff review;
- assumptions;
- approval question.

## Prohibited actions before approval

- writing files to target repo;
- deleting files;
- moving backlog/task files;
- weakening validation policies;
- overwriting existing instructions;
- running destructive commands.
