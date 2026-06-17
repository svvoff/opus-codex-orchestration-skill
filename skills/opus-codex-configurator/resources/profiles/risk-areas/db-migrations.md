# Profile: DB Migrations Risk Area

## Category

risk-area

## When to use

Use when a project includes database migrations, schema changes, seed data, ORM schema files, or data backfills.

## Detection signals

- migrations directories;
- Prisma/Drizzle/TypeORM/Alembic/Rails migrations;
- SQL schema files;
- seed/backfill scripts.

## Adds to project profile

- `risk_areas += ["db-migrations"]`
- strict migration review.

## Codex rules

Codex must not create or modify database migrations unless explicitly authorized.

For migration tasks, Codex must include rollback notes and validation commands.

## Opus rules

Opus must require:

- forward migration plan;
- rollback plan;
- data safety notes;
- compatibility considerations;
- CI/staging validation expectations.

## Validation requirements

Prefer migration dry-runs, schema checks, and integration tests in test databases. Do not run production migrations.
