# Contributing

Thanks for wanting to help with the skills in this repo! Skills are a small, focused format, so the bar for a good contribution is about clarity and usefulness — keep the file lean and make the trigger obvious.

## What makes a good skill here

Each skill lives under [`skills/<name>/`](skills/) and is essentially its `SKILL.md` file plus whatever supporting files (modules, references, scripts) it needs.

A good `SKILL.md`:

- Has YAML frontmatter with **`name`** and **`description`** — the CLI/skills.sh reads these for discovery and the leaderboard. The description should be one line, trigger-first, and state what triggers using the skill.
- States **when to use it** (trigger conditions) and **when not to**.
- Has a **procedure** a model can actually follow — numbered steps, exact commands where relevant.
- Names its **pitfalls** (the failure modes it's designed to prevent).
- Is self-contained — no cross-repo assumptions.

## Adding a new skill

1. Create the folder `skills/<skill-name>/`.
2. Write `SKILL.md` (frontmatter + body, conventions above).
3. Add a `README.md` summarizing it for humans browsing the repo.
4. Keep supporting files (modules/references/scripts) inside the skill folder.
5. Update the repo `README.md` skill table.
6. Verify the CLI can discover it:
   ```bash
   npx skills add carterlasalle/skills --list
   ```

## Editing an existing skill

- Keep `name` stable (renaming breaks installs / leaderboard continuity).
- Small proofreading or clarity fixes: open a normal PR.
- Behavior changes that alter what a skill does: describe the change in the PR body so it can be reviewed against the older intent (this repo's skills encode deliberate discipline — don't silently weaken a rule).

## Process

- Fork the repo, make your change on a branch, open a PR against `main`.
- Keep changes focused — one logical change per PR.
- If your change touches a shared convention (e.g. the fix-don't-freeze philosophy in `ci-fix-dont-freeze`), say so explicitly in the PR.

## Code of conduct

Be constructive, be specific, and assume good intent. This is a small personal skills collection — the goal is skills that actually make agents better, not volume.
