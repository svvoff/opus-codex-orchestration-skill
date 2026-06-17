# Profile: Validation Ladder

## L0 — Static sanity

Build, compile, typecheck, lint, format.

## L1 — Unit tests

Targeted tests for changed logic.

## L2 — Integration tests

Boundaries: API, DB, SDK adapter, provider integration.

## L3 — System/E2E/smoke

Critical user journeys and platform run checks.

## L4 — Domain-specific

Platform-specific validation such as browser smoke, Xcode build, payment sandbox, migration dry-run.

## L5 — Human approval

Sensitive or irreversible changes.
