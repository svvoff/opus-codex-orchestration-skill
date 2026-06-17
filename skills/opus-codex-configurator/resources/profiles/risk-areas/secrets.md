# Profile: Secrets Risk Area

## Category

risk-area

## When to use

Use when a project includes secrets, environment files, tokens, certificates, API keys, signing keys, or credentials.

## Detection signals

- `.env*` files;
- secrets-related CI config;
- key/cert/pem/p12/mobileprovision files;
- environment variable schemas;
- cloud credentials.

## Adds to project profile

- `risk_areas += ["secrets"]`
- strict no-secret-exposure policy.

## Common risk areas

- accidental secret logging;
- committing credentials;
- modifying production credentials;
- weakening env validation;
- exposing private config in generated docs.

## Codex rules

Codex must not print, copy, transform, or commit secrets.

Codex must not modify secret files unless explicitly authorized.

If secret-looking values appear during inspection, Codex and Opus should refer to them generically without repeating the value.

## Opus rules

Opus must avoid including secret values in generated files or reports.

## Validation requirements

If env/schema behavior changes, validation must confirm required variables and failure behavior without exposing values.
