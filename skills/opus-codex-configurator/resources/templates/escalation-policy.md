# Escalation Policy

## Escalate to Opus before editing when

- task scope is ambiguous;
- implementation requires architecture/product decisions;
- high-risk areas are touched;
- validation commands are unclear;
- baseline failures prevent reliable validation;
- changes require dependency upgrades;
- data migrations or destructive operations are involved.

## Escalate to human when

- production config may change;
- payments, billing, or paid access behavior may change;
- auth/authorization behavior may change;
- destructive data behavior may change;
- secrets or credentials are involved;
- legal/compliance/product policy decisions are required;
- release/signing/deployment behavior may change.

## Codex must not proceed silently

If escalation conditions are met, Codex must stop and explain:

- what triggered escalation;
- what decision is needed;
- what safe next step is recommended.
