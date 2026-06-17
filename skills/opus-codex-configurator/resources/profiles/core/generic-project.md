# Profile: Generic Project

## Category

core

## When to use

Use for every target repository.

## Detection signals

Any git repository or project directory.

## Adds to project profile

- common repo hygiene rules;
- draft-first configuration workflow;
- validation evidence requirement.

## Common risk areas

- hidden build/test assumptions;
- stale documentation;
- unknown CI requirements;
- overly broad Codex edits.

## Codex rules

Codex must:

- stay within task scope;
- make minimal coherent changes;
- avoid unrelated formatting churn;
- run relevant validation;
- report evidence;
- stop when requirements are ambiguous or risky.

Codex must not:

- change unrelated files;
- remove tests to make validation pass;
- silence errors without justification;
- change dependencies unless explicitly authorized;
- claim success without evidence.

## Opus rules

Opus must:

- create precise task packets;
- define acceptance criteria;
- define validation commands;
- review Codex output against evidence;
- reject vague or unvalidated results.

## Validation requirements

Use the validation ladder and evidence contract.

## Task packet defaults

Every task packet must include:

- task ID;
- goal;
- background;
- relevant files/areas;
- implementation requirements;
- non-goals;
- constraints;
- acceptance criteria;
- validation commands;
- risk level;
- stop conditions;
- required report format.

## Report requirements

Codex must return the standard execution report.
