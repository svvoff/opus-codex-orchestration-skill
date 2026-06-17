# Repository Inspection

## Purpose

Build an evidence-based profile of the target repository before generating Opus/Codex configuration.

## Rules

- Inspect before asking detailed questions.
- Keep inspection read-only.
- Prefer repository evidence over assumptions.
- Record uncertainty explicitly.
- Ask one follow-up question at a time.
- Do not write generated files during inspection.

## Safe discovery examples

Use safe read-only commands when available:

```bash
pwd
git status --short
ls
find . -maxdepth 3 -type f | sed 's#^./##' | sort | head -200
```

Common files to inspect:

```text
README.md
package.json
pnpm-lock.yaml
yarn.lock
package-lock.json
tsconfig.json
pyproject.toml
Makefile
justfile
Taskfile.yml
.github/workflows/*
.gitlab-ci.yml
*.xcodeproj
*.xcworkspace
Package.swift
Podfile
fastlane/Fastfile
```

## Do not run without approval

```bash
npm install
pnpm install
yarn install
pod install
bundle install
fastlane release
xcodebuild archive
prisma migrate deploy
terraform apply
kubectl apply
```

## Inspection report sections

Always produce:

```md
# Repository Inspection Report

## Detected repo shape

## Detected stack

## Detected package/build tools

## Detected validation commands

## Detected CI checks

## Detected risk areas

## Existing AI instruction files

## Validation gaps

## Missing critical information
```

## Risk signals

Look for signs of:

- authentication;
- authorization;
- payments;
- billing;
- subscriptions;
- DB migrations;
- secrets;
- production config;
- data deletion;
- encryption;
- infrastructure;
- signing;
- entitlements;
- release automation.
