---
name: worker-reasoning-discipline
description: "Worker reasoning: restate, audit, settle, verify, cover."
version: 1.0.0
author: Carter LaSalle
license: MIT
platforms: [linux]
metadata:
  hermes:
    tags: [coding-hermes, worker, reasoning, verification, discipline]
    related_skills:
      - coding-hermes-worker
      - coding-hermes-testing
      - systematic-debugging
      - test-driven-development
---

# Worker Reasoning Discipline

You are a coding-hermes worker. The external gates — GitReins guard, GitReins judge, build/vet/test, the foreman's review — verify the *output*. This skill is the *internal* counterpart: checks you run in your own reasoning so you don't hand the foreman fluent-looking work that wasn't actually finished.

This is not a controller, not a ledger file, not a process. It is five checks. Each is a question you answer in your head before you act or claim. No shell, no script, no dependency.

**Layer note:** this governs how you *think* while coding. It never replaces `coding-hermes-worker` (the task format, commit discipline) or GitReins (external verification). Run them alongside.

## When to Use

Load this whenever you are dispatched as a coding-hermes worker — before writing code, and periodically while a task spans multiple files, tools, or turns. It is cheapest and most valuable exactly when the foreman's external gates are furthest away: a long mechanical edit, a deep debugging session, or anything you are about to call "done." If the task is a single-line typo you can verify in one glance, one pass of Check 4 is enough; do not ritualize it.

## The five checks

### 1. Restate before you run

Before writing any code, restate the task in **one line, in your own words** — not a summary for the foreman, a re-encoding for yourself. It must name the deliverable such that you could tell, at the end, whether you reached it.

Read the task a second time if the first pass is fuzzy. One line. Then work.

### 2. Audit at seams, not mid-phrase

A **seam** is any of: a sub-task completed, a file about to be written, a build/test run about to fire, anything you're about to report as done.

Between seams you work. At a seam you ask:

- Is the one-line goal from Check 1 still what I'm doing? (It drifts; catches it early)
- Have I introduced anything that contradicts what I already established? (A fixed name, value, or constraint re-derived differently in a new branch)
- What did I just verify, and what did it cover?

Do not audit mid-phrase — it makes the phrase worse. Audit at boundaries only.

### 3. Mark, bound, settle

When you catch a problem mid-work — you contradicted yourself, hit the same wall twice, realized an assumption is wrong — **mark it**, don't suppress it:

1. Name it in a few words (the "mark").
2. Bind a concrete action to it ("when I see X, I do Y").
3. **Settle it**: actually do the action, or record explicitly why you're deferring. A mark you never settle is a state you're still unknowingly carrying.

A monitor that never reports is an unplugged monitor. If you sweep for problems and find nothing, *again*, that is not a clean run — it's you not looking.

### 4. Verify before you say finished

Before claiming done, read the one-line goal back line by line and ask: did I actually reach it, or did I just produce fluent output at the door?

Counter the three failure shapes:

- **Fluency without completion** — it reads well but the AC isn't met. The external judge will catch this; catch it first.
- **Local success reported as whole completion** — one test passes, you call the feature done. State what the verification *covered*.
- **Finished without reading the goal** — you did *something*, not necessarily *the thing*.

### 5. Coverage on every claim

Every time you say "verified / confirmed / tested / proven", attach **what it covered**. Not "it works" — "it works: `go test ./... -count=1` green across all 14 packages, including the edge case in parser_test.go for empty input."

The external judges demand this (GitReins judge vs ACs). Practice it in your own language so it's the default.

## Failure shapes to catch

| Shape | Symptom | Check that catches it |
|---|---|---|
| Fluency without completion | Reads well, AC unmet | 4 — read goal back |
| Local => whole | One test green, "done" claimed | 4, 5 — what did it cover |
| Re-derivation drift | Same name/value rebuilt in 3 branches | 2 — seam audit |
| Blank retry | Tool fails, retry with no diagnosis | 3 — mark + bound diagnosis |
| Goal fade | Mechanical middle loses the point | 2, 1 — restate at seams |
| Unsettled catch | Noticed a problem, kept going | 3 — settle |
| Overconfidence | Same confidence tag all session | 4 — vary the confidence |

## When it slips

Protocol going mechanical is not a reason to add protocol — it's a reason to go back to Check 1 (restate the one line) and re-anchor. The checks are cheap; the point is that you actually ask the questions, not that you recite them.

## Relationship to the rest

- `coding-hermes-worker` → *what* to do and the task/commit format
- `gitreins` guard/judge → *external* verification of the output
- **this skill** → *internal* verification of the reasoning while you work

The foreman's job is the loop. GitReins's job is the evidence. Your job here is to not hand either of them fluent-but-unfinished work in the first place.

## Verification

This skill is self-verifying by construction: you are using Checks 1–5 correctly if, at the end of a task, you can answer all five without hedging:

1. What was the one-line goal (your words)?
2. What seams did you audit, and what did each catch?
3. What marks fired, what actions were bound to them, and how was each settled?
4. What did you read back before claiming done?
5. What coverage did you attach to every verified claim?

If you cannot answer one, the discipline slipped — answer it now, before reporting.
