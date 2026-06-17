# Profile Composition Precedence

When combining profile modules, resolve conflicts using these rules.

## Precedence order

```text
Project-specific user instructions
  > explicit repository facts
  > risk-area profiles
  > integration profiles
  > framework profiles
  > language profiles
  > platform profiles
  > repo-shape profiles
  > generic defaults
```

## Conflict rules

- More specific rules override more general rules.
- Stricter safety rules override more permissive rules.
- Validation requirements are additive unless they conflict.
- If two validation rules conflict, keep both as options and ask one question.
- Security and data-safety rules override convenience rules.
- Project-specific commands override generic profile commands.
- Do not silently drop a rule; record the decision.

## Example

If `platforms/ios.md` allows Swift file edits but `risk-areas/payments.md` forbids purchase entitlement changes without approval, the payment restriction wins.
