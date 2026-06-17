# Risk Taxonomy

## auth

Authentication, authorization, permissions, session handling, user identity.

Configurator meaning:
- high-risk;
- explicit task authorization required;
- validation must include positive and negative permission cases.

## payments

Subscriptions, purchases, billing, entitlements, payment providers.

Configurator meaning:
- high-risk;
- human approval before changing production behavior;
- validate edge cases: retry, restore, cancellation, unavailable provider.

## ads

Ad SDKs, rewarded ads, interstitials, monetization triggers.

Configurator meaning:
- medium/high risk;
- isolate SDK behind adapter;
- validate unavailable/skipped/completed ad states;
- do not mix reward granting with UI-only logic.

## platform-compliance

Platform rules such as Yandex Games, App Store, Google Play, browser policies.

Configurator meaning:
- integration changes must be scoped;
- SDK initialization and production config require review.

## production-config

Production endpoints, env vars, signing, entitlement files, release config.

Configurator meaning:
- do not modify without explicit approval.

## secrets

Tokens, keys, credentials, private certs.

Configurator meaning:
- never expose, print, commit, or rotate without explicit human instruction.

## db-migrations

Schema changes, data migrations, destructive data operations.

Configurator meaning:
- high-risk;
- require dry-run/rollback plan.

## data-deletion

Deletion of user data, records, files, backups.

Configurator meaning:
- high-risk;
- requires human approval.
