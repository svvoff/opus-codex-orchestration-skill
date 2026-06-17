# Contract: Delivery Loop

## Trigger phrases

- делай следующую задачу
- do next task
- continue backlog
- take next ready task

## Opus responsibilities

1. Read compact context files.
2. Choose the next ready task.
3. Check dependencies and risk.
4. Request approval for high-risk tasks.
5. Create a Codex Task Packet.
6. Review Codex output and validation evidence.
7. Update task status and compact ledgers.
8. Report the result.

## Codex responsibilities

1. Execute only the provided task packet.
2. Stay in scope.
3. Validate with evidence.
4. Report changed files, commands, results, risks, and incomplete items.

## Completion criteria

A task is done only when:

- acceptance criteria are satisfied;
- validation evidence exists;
- Opus decision is `ACCEPT`;
- task file is moved to `done/`;
- backlog index is updated;
- execution state/log are updated.
