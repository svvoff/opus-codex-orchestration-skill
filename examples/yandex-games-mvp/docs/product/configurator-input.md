# Configurator Input

## Project summary

Browser hypercasual game for Yandex Games, MVP-first, with ad monetization planned after core loop validation.

## Current stage

MVP planning / early implementation.

## Likely technical shape

- Web game
- TypeScript or JavaScript likely
- Yandex Games SDK expected later
- No backend initially

## Product constraints that affect engineering

- Fast iteration is more important than heavy architecture.
- Platform SDK must be isolated.
- Ads must not be mixed into core gameplay.
- Core loop should run locally without platform SDK.

## Risk areas for Opus/Codex configuration

- ads
- platform-compliance
- analytics
- browser compatibility
- performance
- save data

## Validation priorities

- build works;
- game runs in browser;
- core loop smoke test;
- mobile browser sanity check;
- SDK can be disabled/mocked locally when added.

## Recommended task style

Small vertical slices. Gameplay tasks separate from platform SDK and monetization tasks.
