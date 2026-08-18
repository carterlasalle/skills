# Ship the skill set as a native Claude Code plugin; defer a native Codex plugin

These skills have always been installable via skills.sh (`npx skills add carterlasalle/skills`), which copies editable skill files into a user's project across Claude Code, Codex, and other Agent-Skills-standard harnesses.

We ship a native **Claude Code plugin** (`.claude-plugin/`) and defer a native **Codex plugin**.

## The constraint: bucketed skills vs. single-path selection

Skills live in bucket folders under `skills/` — `engineering/` is **promoted** (shipped); `misc/`, `in-progress/`, and `deprecated/` are **not**.

- **Claude Code** — `.claude-plugin/plugin.json` accepts `skills` as an **array of explicit skill-directory paths**. We list the promoted skills one by one. `.claude-plugin/marketplace.json` makes the repo its own single-plugin marketplace.
- **Codex** — `.codex-plugin/plugin.json` (not yet added) accepts `skills` only as a single path string. Shipping it would require either restructuring so `skills/` contains only promoted skills or committing duplicate copies — both deferred.

## Decision

- Ship the Claude Code plugin now, curated to the promoted set.
- Keep skills.sh as the universal installer (serves Codex and other harnesses today).
- Defer a native Codex plugin until the manifest constraints are resolved.

## Invariants this creates

- Every promoted (`engineering/`) skill has an entry in `.claude-plugin/plugin.json`'s `skills` array.
- `.claude-plugin/plugin.json`'s `version` tracks `package.json`'s version — `scripts/sync-plugin-version.mjs` keeps them in sync on release.
