## What it does

`worker-reasoning-discipline` gives a coding worker five internal checks — **restate, seam-audit, mark-settle, verify-before-done, coverage** — run in its own reasoning so it doesn't hand back fluent-looking work that wasn't finished. Its defining constraint: it complements external gates (GitReins guard/judge, build/test) with in-token discipline that catches *fluency without completion* before the external judge ever sees it.

## When to reach for it

The agent reaches for this when dispatched as a worker on any multi-step, multi-file task — typically loaded alongside a worker skill (`--skills coding-hermes-worker,worker-reasoning-discipline`). Type `/worker-reasoning-discipline` to bring it up explicitly.

For a single-line typo you can verify in one glance, one pass of "verify before done" is enough — don't ritualize it.

## Common questions

**What does "mark, bind, settle" mean?** When you catch a problem mid-work, you name it (mark), bind a concrete action ("when I see X, I do Y"), then *actually do it* (settle). A mark you never settle is a problem you're still carrying.

**How is this different from `j-space`?** This is the controller-free, no-ledger version — five questions you answer in your head. `j-space` is the fuller suite with a durable ledger and optional Python controller. Start here; go to `j-space` only when you need persisted state across many turns.

## It's working if

- At the end of a task you can answer all five checks without hedging (one-line goal, seams audited, marks settled, goal read back, coverage attached to every claim).
- You caught at least one "I was about to say done but the goal isn't actually met" moment yourself.

## Where it fits

A **model-invoked** skill loaded by workers. It's the *moment-to-moment reasoning* layer. Neighbours: `ci-fix-dont-freeze` (philosophy), `j-space` (fuller suite).
