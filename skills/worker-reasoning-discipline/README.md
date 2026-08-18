# worker-reasoning-discipline

**Category:** `coding-hermes` · **Status:** Active

Internal reasoning checks for coding workers — **restate, seam-audit, mark-settle, verify-before-done, coverage** — that complement external quality gates with in-token discipline.

## When to use

Loaded alongside a worker skill (e.g. `--skills coding-hermes-worker,worker-reasoning-discipline`). Gives the model five checks it runs in its own reasoning so it doesn't hand back fluent-looking work that wasn't actually finished.

## The five checks

1. **Restate** — re-encode the task in one line, in your own words, before coding.
2. **Seam audit** — at each task boundary (tool call, file write, build fires, "done" claimed) check goal-drift, contradiction, and coverage.
3. **Mark → bind → settle** — catch a problem, name it, bind a concrete action, actually settle it.
4. **Verify before done** — read the goal back; counter "fluency without completion."
5. **Coverage on every claim** — attach *what* every "verified/tested/proven" covered.

No controller, no ledger file, no process. Just questions you answer before acting.

## Relationship

- `coding-hermes-worker` — *what* to do, task format, commit discipline
- `gitreins` guard/judge — *external* verification of output
- **this skill** — *internal* verification of the reasoning while you work
- `ci-fix-dont-freeze` — the fix-all philosophy that pairs with it on CI runs

See `SKILL.md` for the full failure-shapes table and verification.
