# Profile: Validation Ladder

## Category

validation

## When to use

Use for every generated Opus/Codex configuration.

## Validation levels

### L0 — Static sanity checks

Examples:

- formatting;
- lint;
- typecheck;
- compile/build.

### L1 — Targeted unit tests

Examples:

- tests for the changed module;
- regression test for bugfix;
- edge case tests.

### L2 — Integration tests

Examples:

- API + DB tests;
- auth flow tests;
- payment adapter tests;
- service boundary tests.

### L3 — End-to-end / system tests

Examples:

- login;
- onboarding;
- checkout;
- critical user journeys.

### L4 — Domain-specific validation

Examples:

- Xcode build/test;
- migration dry-run;
- contract tests;
- accessibility checks;
- visual regression;
- manual sandbox flow.

### L5 — Human approval gate

Required for high-risk changes:

- auth;
- payments;
- billing;
- production config;
- migrations;
- data deletion;
- secrets;
- infrastructure;
- encryption;
- signing/release config.

## Rule

The validation level must match the risk and scope of the change.
