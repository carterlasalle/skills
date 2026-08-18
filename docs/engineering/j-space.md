## What it does

`j-space` is a reasoning-discipline suite that treats a model's accessible working representations as a **deliberately managed workspace** — pass gating (`fast`/`full`/`loop`), seam audits, and a durable `Goal / Core / Verified / Open / Next` ledger that keeps task state alive across turns, files, and long gaps. Its defining constraint: **only load the machinery the task earns** — simple work gets nothing, hard long-horizon work gets the ledger, checkpointing, and recovery.

## When to reach for it

Type `/j-space`, or the agent reaches for it when a task needs more than fluent output: multi-step chained reasoning, long-horizon/agentic work, complex debugging, or carrying state across many turns. For day-to-day worker discipline with no need for a persisted ledger, prefer `worker-reasoning-discipline` — j-space is the fuller version.

## Common questions

**Is the "J-space / inner workspace" framing real?** The load-bearing value is the discipline — state-tracking, seam audits, coverage-gated verification. The "J-space" framing is explanatory scaffolding; you don't need to believe it to benefit from a ledger that survives compaction.

**What does the optional controller do?** `scripts/jspace.py` externalizes loop state into `.jspace/` — atomic ledger/history writes, stable checkpoint IDs, `Core` slot swaps, coverage-gated checkpoints, and full reload after long gaps. It records and reports state; it never chooses the solution.

## It's working if

- The goal doesn't evaporate mid-task — you can name the one or two items currently "on the stage."
- State survives a long gap (compaction / session boundary) — the ledger restores it.
- Nothing was called "verified" without stating what it covered.

## Where it fits

A **reach-for-it-anytime standalone** for long, stateful work. Neighbours: `worker-reasoning-discipline` (lighter, controller-free), `ci-fix-dont-freeze` (the CI/type discipline).
