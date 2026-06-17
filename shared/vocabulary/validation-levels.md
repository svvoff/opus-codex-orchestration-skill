# Validation Levels

## L0 — Static sanity

Formatting, lint, typecheck, compile/build.

## L1 — Unit tests

Targeted tests for changed behavior.

## L2 — Integration tests

API, DB, SDK adapter, service boundary tests.

## L3 — System / E2E

Critical flows and user journeys.

## L4 — Domain-specific validation

Platform-specific checks such as Xcode build, browser smoke test, SDK mock mode, payment sandbox, migration dry-run.

## L5 — Human approval gate

Auth, payments, production config, secrets, data deletion, release/deploy.
