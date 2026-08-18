Skills are organized into bucket folders under `skills/`:

- `engineering/` — daily code and agent-reasoning work (promoted)
- `misc/` — kept around but rarely used, not promoted
- `in-progress/` — beta: public on purpose, feedback wanted, not shipped in the plugin
- `deprecated/` — no longer used

Every skill in `engineering/` (the **promoted** bucket) must have a reference in the top-level `README.md` and an entry in `.claude-plugin/plugin.json`'s `skills` array (the Claude Code plugin ships exactly the promoted set). Skills in `misc/`, `in-progress/`, and `deprecated/` must not appear in either.

Install commands are copied verbatim from [.agents/install-block.md](./.agents/install-block.md). `.claude-plugin/marketplace.json` makes the repo its own single-plugin marketplace — a fallback the install block explains, not the documented route. Run `claude plugin validate . --strict` after touching either manifest.

Each skill entry in the top-level `README.md` must link the skill name to its `SKILL.md`.

Each bucket folder has a `README.md` that lists every skill in the bucket with a one-line description, with the skill name linked to its `SKILL.md`. The promoted bucket's `README.md` groups entries into **User-invoked** and **Model-invoked**; non-promoted bucket `README.md`s use a flat list.

Skills in `engineering/` also have a human-facing docs page at `docs/engineering/<skill-name>.md` (the docs tree mirrors the bucket folder under `skills/`). When you add, rename, or change the behaviour of a skill in `engineering/`, create or re-sync its docs page following [.agents/writing-docs.md](./.agents/writing-docs.md). Skills in the non-promoted buckets get **no** docs page.

Every `SKILL.md` is either user-invoked (`disable-model-invocation: true` in frontmatter plus `policy.allow_implicit_invocation: false` in `agents/openai.yaml`, reachable only by the human) or model-invoked (model- or user-reachable). See [.agents/invocation.md](./.agents/invocation.md).

To (re)link every skill into the local harness skill directories (`~/.claude/skills`, `~/.agents/skills`), run `scripts/link-skills.sh`. Each entry is a symlink into this repo, so a `git pull` keeps installed skills current; re-run the script after adding, removing, or renaming a skill.

To list every skill in the repo: `scripts/list-skills.sh`.

Version bumps flow through changesets (`.changeset/`). `npm run version` runs `changeset version` then `scripts/sync-plugin-version.mjs` to keep `.claude-plugin/plugin.json`'s `version` in sync with `package.json`. The `Release` workflow (`.github/workflows/release.yml`) opens the version PR and tags on merge to `main`.
