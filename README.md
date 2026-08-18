# Skills — Independent Skills Collection

[![skills.sh](https://skills.sh/b/carterlasalle/skills)](https://skills.sh/carterlasalle/skills)

An **independent** collection of custom-created agent skills. This repo is NOT a fork of the Coding Hermes fleet skills (that lives at [`carterlasalle/coding-hermes-skills`](https://github.com/carterlasalle/coding-hermes-skills)). This one is pure *custom* skills I build and maintain directly.

## Skills

| Skill | What It Does |
|-------|-------------|
| [`ci-fix-dont-freeze`](skills/ci-fix-dont-freeze/) | Fix CI/lint/type errors as **clues** of unfinished, unwired, broken code — never suppress or baseline-freeze; trace to root and wire it |
| [`worker-reasoning-discipline`](skills/worker-reasoning-discipline/) | Internal reasoning checks for workers — restate, seam-audit, mark-settle, verify-before-done, coverage |
| [`j-space`](skills/j-space/) | Agent reasoning-discipline suite — pass gating, seam audit, Goal/Core/Verified/Open/Next ledger, coverage-gated verification, optional controller |

## Install from skills.sh

The skills under [`skills/`](skills/) are indexed by [skills.sh](https://skills.sh/carterlasalle/skills). Install them with the skills CLI:

```bash
# All skills
npx skills add carterlasalle/skills

# Individual skills
npx skills add carterlasalle/skills --skill ci-fix-dont-freeze
npx skills add carterlasalle/skills --skill worker-reasoning-discipline
npx skills add carterlasalle/skills --skill j-space
```

## Repo layout

```text
skills/
├── README.md                        ← this file
└── skills/                          ← skills.sh-indexed skill folders
    ├── ci-fix-dont-freeze/           (SKILL.md + README.md)
    ├── worker-reasoning-discipline/  (SKILL.md + README.md)
    └── j-space/                      (SKILL.md + modules/ + references/ + scripts/)
```

## Publishing to skills.sh

Skills are auto-indexed by skills.sh from this public repo's `skills/<name>/SKILL.md` layout — no submission step. Each skill's `SKILL.md` must have `name` + `description` in YAML frontmatter (that's what the CLI reads for discovery and the leaderboard).

## Related

- [`carterlasalle/coding-hermes-skills`](https://github.com/carterlasalle/coding-hermes-skills) — my fork of the Coding Hermes fleet skills
- [skills.sh](https://www.skills.sh/docs) — the agent skills directory
