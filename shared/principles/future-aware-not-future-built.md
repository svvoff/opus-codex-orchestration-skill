# Future-Aware, Not Future-Built

Roadmap context should influence boundaries and guardrails, not cause premature implementation.

## Good

- Isolate platform SDKs behind adapters if future integrations are expected.
- Keep gameplay/domain logic testable without platform SDKs.
- Avoid hardcoding assumptions that will obviously block roadmap stages.

## Bad

- Building the post-MVP shop, leaderboard, analytics, or live ops systems during MVP without task approval.
- Adding complex abstractions solely because they might be useful later.
- Expanding executor task scope beyond the current task card.
