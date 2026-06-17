# Profile: Payments Risk Area

## Category

risk-area

## When to use

Use when the repository includes payments, subscriptions, billing, invoices, entitlements, purchase flows, or paid access.

## Detection signals

- Stripe, RevenueCat, StoreKit, Paddle, Braintree, PayPal;
- billing/invoice/subscription/payment directories;
- entitlement or paywall logic;
- webhook handlers for payment providers.

## Adds to project profile

- `risk_areas += ["payments", "billing"]`
- high review strictness;
- human approval for production-impacting changes.

## Common risk areas

- incorrect entitlement access;
- duplicate charges;
- webhook idempotency;
- subscription state bugs;
- sandbox/production config confusion;
- payment provider contract changes.

## Codex rules

Codex must not modify payment logic, entitlement mapping, product identifiers, billing webhooks, or purchase validation unless explicitly authorized.

For payment-related tasks, Codex must provide validation evidence and clearly identify any production-risk changes.

## Opus rules

Opus must require precise acceptance criteria and should consider human approval for payment behavior changes.

## Validation requirements

Require targeted tests for payment state transitions, duplicate event handling, webhook idempotency, or entitlement behavior as applicable.

## Task packet defaults

Include affected payment provider, sandbox/production distinction, idempotency expectations, and rollback notes.

## Report requirements

Codex must state whether charges, entitlements, subscriptions, or production identifiers were affected.
