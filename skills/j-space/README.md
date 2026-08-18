# j-space

**Category:** general (worker reasoning) · **Status:** Active

An agent-facing reasoning-discipline skill: establishes an "inner workspace" framing and provides nine modules (capacity, broadcast, directed-focus, deep-reasoning, introspection, self-monitoring, shorthand, markers, empirics) plus an optional ledger controller (`scripts/jspace.py`).

## What it is

A prompt-suite that gives an agent a reusable internal protocol for long, multi-step, or stateful work: restate the task, gate effort by pass (`fast`/`full`/`loop`), audit state at seams, carry a `Goal / Core / Verified / Open / Next` ledger across turns, and verify completion against coverage.

## Why it's here

Published as a self-contained skill. Note: the "J-space / inner workspace" framing is explanatory — the load-bearing value is the discipline (state-tracking, seam audit, coverage-gated verification), not the "research" narrative. Pair with `worker-reasoning-discipline` for a controller-free version of the same ideas.

## Structure

- `SKILL.md` — the entry: premise, gate, routing table, invariants
- `modules/` — nine focused protocols
- `references/` — science framing, induction playbook, exemplars
- `scripts/` — `jspace.py` ledger controller + `verify_suite.py` integrity checker

## Install

```bash
npx skills add carterlasalle/skills --skill j-space
```

## Note on scope

For a coding fleet, prefer `worker-reasoning-discipline` (controller-free, gitreins-aligned). j-space is the fuller version and is kept here for reference and standalone use.
