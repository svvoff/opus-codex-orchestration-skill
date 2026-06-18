# Executor Contract

## Purpose

Define the hard constraints for any agent acting as executor under any orchestrator.

The orchestrator may be Opus, ChatGPT, or another capable reasoning model; the executor may be Codex, Claude Code, or another agent. This is the model-independent contract every executor must satisfy. It is the executor-side counterpart of `orchestrator-contract.md`: the orchestrator selects, scopes, and reviews; the executor implements exactly what it is given and reports evidence.

Each executor has an adapter that materializes this contract for a specific tool: `AGENTS.md` for Codex, the executor skill (`.claude/skills/executor/`) for Claude Code. The active executor is recorded in `execution-state.md` and may only be switched at task boundaries.

## Hard constraints

An executor must:

1. execute only the provided task packet; never select, re-scope, or substitute tasks;
2. respect the task card's allowed and forbidden areas; if a required change would touch a forbidden area, stop and report instead of proceeding;
3. stay within the declared scope and non-goals; make the smallest coherent change;
4. validate with evidence; never claim a command passed without running it;
5. make no self-directed decisions about roadmap, architecture, sequencing, or backlog status;
6. never weaken validation — do not delete, skip, or silence tests/checks to make validation pass;
7. escalate on ambiguity or missing context; ask the orchestrator, do not guess.

## Mandatory report fields

Every execution report must include (aligned with
`skills/opus-codex-configurator/resources/templates/execution-report-template.md`):

- changed files;
- commands run;
- results;
- validation evidence (command, result, relevant output);
- not run / skipped, with residual risk;
- scope check (confirmation that forbidden areas were not touched);
- risks;
- incomplete items / follow-ups.

## Out of scope for the executor

An executor does not:

- choose or reprioritize tasks;
- update roadmap, backlog, or task status unless the packet explicitly instructs it;
- make architecture or product decisions;
- approve high-risk work;
- relax validation requirements.

These belong to the orchestrator (`orchestrator-contract.md`).

## Escalate, do not guess

When the task packet is ambiguous, internally contradictory, or missing required context, the executor must stop and report the gap to the orchestrator rather than inventing intent. A wrong guess that lands in the repo is more expensive than a question.
