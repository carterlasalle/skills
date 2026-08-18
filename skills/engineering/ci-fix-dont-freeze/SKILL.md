---
name: ci-fix-dont-freeze
description: "Fix CI errors as clues of unfinished, unwired, broken code."
version: 1.0.0
author: Carter LaSalle
license: MIT
platforms: [linux]
metadata:
  hermes:
    tags: [ci, lint, type-check, debugging, fix, quality]
    related_skills:
      - systematic-debugging
      - code-review
      - github-pr-workflow
      - fix-dont-freeze
---

# CI Fix — Don't Freeze

Use this whenever the task is to fix CI/CD, lint, or type-check errors — a directive like "fix all CI errors", "clean up the lint", "make type-check pass", "get CI green". This skill defines **how** you fix them.

## When to Use

Load this the moment the ask is to make CI, lint, or a type-check pass — whether it's a whole repo (hundreds of errors), a single package, or one new check failing. It's for any "get it green" task where an error could be fixed either by *correcting code* or by *suppressing/removing code* — this skill forces the former. Skip it for behavior features or runtime bug-fixes that have nothing to do with a check failing; those belong to `systematic-debugging`.

## The core premise

**A CI, lint, or type error is a clue — not a nuisance, not a blocker, and never something to remove or suppress.**

Every error and warning points at real code that is:

- **unwired** — built but never connected to anything that calls it
- **unfinished** — started, then abandoned mid-edit
- **broken** — implemented wrong, or its contract drifted
- **sloppy** — left inconsistent with the codebase's own conventions, or with what it claims to do

Your job is to **trace each error to its root intent and fix it so it is finished, wired, and green** — not to make the check pass by papering over the error.

## What this forbids

- **Never freeze a backlog to go green.** No baseline files that silence `N` existing errors (e.g. a pyright/basedpyright `baseline.json` that freezes the current backlog and gates on new errors only). Every existing error that ships is an error that will get lost — it will be "existing" forever and no one will ever touch it again. The goal is **zero**, not "no new ones."
- **Never `# type: ignore`, `// @ts-ignore`, waffling comments, or suppression flags** without fixing the underlying cause. Suppression is the check's way of admitting defeat — your way is to make the line legitimately type-correct or actually delete dead code.
- **Never delete or "scope out" an error that points at real wiring.** There's no such thing as out-of-scope or "pre-existing" during a fix-all run. Untouched errors get lost.

## The fix procedure

For **every** error/warning, one at a time:

1. **Read it as a question.** "Why does this error exist?" — not "how do I suppress it?" Read the line, its file, and the check's message.
2. **Trace the intent.** Follow the symbol/function/parameter through the code and the specs:
   - Who calls it? Who is *supposed* to call it but doesn't?
   - Does a spec, PRD, interface, or type definition say this should exist?
   - Is this an extra parameter, or a parameter some caller relies on that we haven't wired yet?
3. **Judge it honestly.** Is it genuinely a mistake (dead, never needed), or is it a **clue that something else is unwired**? The classic example: a function has an extra parameter. Do NOT remove it on sight. Trace it — it is usually a half-implemented feature, an interface contract, or a spec requirement that the rest of the code hasn't caught up to yet. If the spec/interface says it should be there, the fix is to **wire the missing caller**, not delete the parameter. Only remove it if the trace proves it was truly a mistake with no contract needing it and no caller depending on it.
4. **Fix at the root.** Wire it, finish it, or fix the contract. If it's dead code, delete it properly (and its now-unreachable references). If it's a real error, fix the logic. If the error is a symptom of a design mismatch, resolve the mismatch.
5. **Re-run the check.** The specific error is gone and **nothing new** appeared. Keep the whole check green, not just the line you touched.
6. **Commit + push continuously.** Don't batch everything to the end. Working, green increments pushed to the branch is the deliverable — and a commit that exists only locally is not done.

## Scope creep is the rule

When you are in a fix-all CI/type run, **allow (and expect) scope creep**:

- Fixing one error will surface a *related* error in code you didn't originally plan to touch — fix it too, it's the same root cause.
- A "pre-existing" error is a lie: it will never be fixed if you don't fix it now. Fix it.
- Adjacent sloppiness (a half-wired call, a stale comment, an inconsistent type) discovered while tracing is in scope.
- The only guard: keep changes honest and verified — each increment builds, tests, and the whole check suite passes. Breadth of fixes; no breadth of *unverified* fixes.

## Errors are clues, warnings are clues too

Warnings are not lesser errors — they're often *earlier* clues (a deprecation, a shadowed name, an unused import, a type mismatch that strict mode would catch). Fix them with the same trace-first discipline. A clean build where warnings were silenced is a build that lost information.

## Pitfalls

- **Removing the extra parameter instead of tracing it.** A parameter is a contract with the codebase and possibly a spec. Removing it without checking callers/specs destroys wiring. Trace first. **Proven:** mockingbird 2026-08-14 — the correct fix for a "wrong parameter" error was to wire the missing integration, not remove the parameter.
- **Baseline-freeze to "manage" a backlog.** Tempting for 800+ errors; always wrong. A baseline turns a fix-all into "stop growing the debt," and the debt stays forever. Fix to zero.
- **`type: ignore` / `ignore`-to-green.** The suppression makes your diff look clean and leaves the underlying bug in the code. Weight of the error is real — the type checker found a genuine ambiguity; resolve it.
- **Stopping at "the build passes."** Passing ≠ correct. The deliverable is finished + wired + green. A stub that compiles but never got wired is still unfinished.
- **Treating "pre-existing" as out of scope.** In a fix-all run there are no pre-existing errors — only unfixed ones.

## Verification

You are done when:

- Every CI, lint, and type check runs **green with zero errors and zero warnings** — not "green modulo a baseline," not "green because I suppressed them."
- For each error you resolved, you can state whether it was **wired, finished, or deleted** (dead code) — and if you followed the trace, you can name the callers/specs you checked before deciding.
- No suppression clauses, baseline files, or ignore-directives were added for code that should genuinely be fixed.
- All increments are committed **and pushed**.

If any check is green via suppression instead of a real fix, the run is not complete — go back and fix the cause.

## Relationship to other skills

- `systematic-debugging` — for genuinely hard runtime bugs behind a CI failure
- `github-pr-workflow` — branch/commit/PR mechanics
- `requesting-code-review` — pre-commit review once green

This skill defines the *philosophy and fix trajectory*; the mechanics of committing live in those.
