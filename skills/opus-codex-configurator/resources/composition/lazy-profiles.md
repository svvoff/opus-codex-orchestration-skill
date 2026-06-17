# Lazy Profiles

Profiles are created only when needed.

## Create a new profile when

- no existing profile matches the detected stack/integration/risk/validation type;
- the rules are likely reusable;
- the project has stack-specific validation or forbidden areas;
- future similar projects would benefit.

## Do not create a profile when

- the rule is only project-specific;
- the rule is a one-off naming detail;
- the content belongs in the target project config only.

## Profile draft sections

- Profile name
- Category
- When to use
- Detection signals
- Adds to project profile
- Common risk areas
- Codex rules
- Opus rules
- Validation requirements
- Task packet defaults
- Report requirements
- Conflicts / precedence
- Open questions

Never save a new profile until the user approves.
