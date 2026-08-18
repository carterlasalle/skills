# ci-fix-dont-freeze

**Category:** `github` · **Status:** Active

Fix CI/CD, lint, and type-check errors as **clues** of unfinished, unwired, broken, or sloppy code — never as nuisances to remove or suppress.

## When to use

Any task that says "fix all CI errors", "clean up the lint", "make type-check pass", or "get CI green". The moment the ask is to make a check pass, this skill forces the **fix-the-cause** path over the **suppress-it** path.

## What it enforces

- **Errors are clues.** Every error/warning points at code that is unwired, unfinished, broken, or sloppy.
- **No baseline-freeze to go green.** No `baseline.json` that silences N existing errors. Goal is **zero**, not "no new ones."
- **No suppression flags.** No `type: ignore` / `@ts-ignore` / waffle comments that paper over a fixable cause.
- **No "out of scope" or "pre-existing."** Untouched errors get lost. Fix them now — scope creep is the rule.
- **Trace before deleting.** An extra function parameter is usually a half-implemented feature or spec contract whose caller isn't wired yet — trace it through code and specs before removing anything.

## The fix loop

1. Read the error as a question ("why does this exist?")
2. Trace intent through callers + specs
3. Judge honestly: genuine mistake, or clue of something unwired?
4. Fix at the root (wire it, finish it, or delete dead code properly)
5. Re-run the whole check — line fixed, nothing new
6. Commit + push continuously

## Relationship

- `systematic-debugging` — hard runtime bugs behind a failing check
- `github-pr-workflow` — branch/commit/PR mechanics
- `worker-reasoning-discipline` — the moment-to-moment reasoning checks while fixing

See `SKILL.md` for the full procedure, pitfalls, and verification rules.
