## What it does

`ci-fix-dont-freeze` fixes CI, lint, and type-check errors as **clues** — every error points at code that is unwired, unfinished, broken, or sloppy. Its defining constraint: **you never suppress or baseline away an existing error**. The goal is zero errors, not "no new ones," and "out of scope" doesn't exist in a fix-all run.

## When to reach for it

The agent reaches for this whenever a task is "fix all CI errors", "clean up the lint", "make type-check pass", or "get CI green". You can also type `/ci-fix-dont-freeze` deliberately.

| Your situation | Where it leads |
| --- | --- |
| A check fails and the temptation is `type: ignore` / a baseline | `ci-fix-dont-freeze` — trace the cause instead |
| An "extra" function parameter you're about to delete | Trace it first: it's usually a half-implemented feature whose caller isn't wired |
| "These are pre-existing errors, out of scope" | In scope. Untouched errors get lost. |

## Common questions

**What if the error is genuinely dead code?** Then you delete it properly — including its now-unreachable references. The skill forbids *suppressing* an error, not removing genuinely dead code. The requirement is that you trace before you delete, so you only remove what the specs/callers prove is a mistake.

**What does "scope creep is the rule" mean?** Fixing one error surfaces a related one in code you weren't planning to touch — fix it too, it's the same root cause. A "pre-existing" error won't be fixed later; fix it now. The only guard is that each increment stays verified (builds, whole suite green).

## It's working if

- Every CI, lint, and type check is green with **zero errors and zero warnings** — not "green modulo a baseline."
- No `type: ignore`, `@ts-ignore`, or suppression flags were added for fixable code.
- For each fixed error you can say whether it was **wired, finished, or deleted (dead code)** — and name the callers/specs you checked.
- All increments are committed **and pushed**.

## Where it fits

A **reach-for-it-anytime standalone**. It's the philosophy layer; pair it with `worker-reasoning-discipline` for the moment-to-moment reasoning checks while you fix. Neighbour: `worker-reasoning-discipline`.
