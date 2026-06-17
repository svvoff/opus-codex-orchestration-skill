# Contract: Project Context Packet

The Project Context Packet is produced by `project-discovery` and consumed by downstream planning/configuration.

## Required sections

- Project identity
- Product goal
- Business goal
- Target users
- MVP hypothesis
- Functional requirements
- Non-functional requirements
- Platform constraints
- Monetization model
- Risk areas
- Success metrics
- Assumptions
- Open questions

## Token-aware rule

The full packet is not read by default during normal task execution. Important active facts must be summarized into:

- `docs/product/current-state.md`
- `docs/product/configurator-input.md`
