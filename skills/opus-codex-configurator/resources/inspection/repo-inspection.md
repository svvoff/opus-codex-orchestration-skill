# Repository Inspection

## Purpose

Build an evidence-based project profile before generating Opus/Codex configuration.

## Rules

- Inspect before asking detailed questions.
- Prefer repository evidence over user assumptions.
- Keep inspection read-only.
- Record uncertainty explicitly.
- Ask one follow-up question at a time.

## Inspect for

- repo shape;
- language and framework signals;
- package managers;
- build/test/lint/typecheck scripts;
- CI workflows;
- deployment/release scripts;
- risk areas;
- existing docs;
- existing AI config files;
- validation gaps.

## Safe commands

Examples:

```bash
pwd
git status --short
find . -maxdepth 3 -type f
ls
cat README.md
cat package.json
cat pyproject.toml
cat Makefile
ls .github/workflows
```

Do not run installs, migrations, deploys, archives, releases, or destructive commands without approval.

## Output

Always produce a Repository Inspection Report before the configuration draft.
