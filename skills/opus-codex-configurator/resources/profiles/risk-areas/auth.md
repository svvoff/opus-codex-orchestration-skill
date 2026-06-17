# Profile: Auth Risk Area

## Category

risk-area

## When to use

Use when the repository includes authentication, authorization, sessions, identity providers, permissions, roles, or access control.

## Detection signals

- files/directories named auth, session, permission, role, policy, middleware, guard;
- OAuth/OIDC/Firebase Auth/Supabase Auth/Clerk/Auth0 dependencies;
- login/logout/signup flows;
- JWT/session/cookie handling.

## Adds to project profile

- `risk_areas += ["auth", "authorization"]`
- high review strictness;
- explicit approval needed for access-control changes.

## Common risk areas

- privilege escalation;
- accidental public access;
- session leaks;
- token handling;
- weakening authorization checks;
- insecure logging of sensitive data.

## Codex rules

Codex must not modify authentication or authorization behavior unless the task packet explicitly authorizes it.

For auth-related tasks, Codex must:

- identify affected permission boundaries;
- add/update tests for allowed and denied cases;
- preserve existing security invariants;
- report any behavior change clearly.

## Opus rules

Opus must define:

- who is allowed;
- who is denied;
- expected status/error behavior;
- relevant tests;
- human approval need.

## Validation requirements

Require tests for positive and negative authorization paths when behavior changes.

## Task packet defaults

Include roles, permissions, session state, expected failures, and non-goals.

## Report requirements

Codex must report whether auth behavior changed and which tests prove it.
