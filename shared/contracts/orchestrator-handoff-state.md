# Orchestrator Handoff State Contract

## Purpose

Record the current orchestrator mode and constraints when work moves between Opus, ChatGPT, or another orchestrator.

## Required fields

- current orchestrator;
- mode: primary / conservative-fallback / emergency;
- reason for mode;
- allowed scope;
- restrictions;
- last completed task;
- current task, if any;
- files read for current context;
- unresolved risks;
- next recommended action.

## Update rules

Update this file when:

- switching from Opus to ChatGPT;
- switching from ChatGPT back to Opus;
- entering Codex-only emergency mode;
- resuming after an interrupted task;
- changing fallback restrictions.
