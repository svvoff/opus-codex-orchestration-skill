# Composable Profile Schema

Use this structure for all reusable profile modules.

```md
# Profile: <Name>

## Category

platform | language | framework | integration | repo-shape | risk-area | validation

## When to use

## Detection signals

## Adds to project profile

## Common risk areas

## Codex rules

## Opus rules

## Validation requirements

## Task packet defaults

## Report requirements

## Conflicts / precedence

## Open questions
```

Profiles should be reusable and not overly project-specific.

If a rule mentions a concrete internal filename, team name, or business rule unique to one repository, it probably belongs in the generated project config rather than a reusable profile.
