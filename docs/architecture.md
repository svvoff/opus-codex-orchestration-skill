# Architecture

This skill has four main layers.

## 1. Inspection layer

Builds an evidence-based picture of the target repository. This includes repo shape, stack, package managers, CI, test commands, risky areas, and existing AI instruction files.

## 2. Profile composition layer

Maps facts from the repository and user answers to reusable composable profiles. Missing profiles are created lazily as drafts.

## 3. Validation architecture layer

Defines how Codex must prove that an implementation works. Validation evidence is mandatory for acceptance.

## 4. Generation layer

Generates project-specific configuration files for Opus and Codex. Draft-first, write-after-confirmation.
