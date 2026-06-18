# Backlog-Driven Execution

After discovery and configuration, the normal workflow should be:

```text
User: делай следующую задачу
  -> Opus reads compact state and backlog indexes
  -> Opus selects next ready task
  -> Opus creates Task Packet
  -> the executor implements and validates
  -> Opus reviews evidence
  -> Opus updates docs and task state
```

Codex should not choose tasks from the backlog. Opus owns planning, sequencing, risk gates, and acceptance.
