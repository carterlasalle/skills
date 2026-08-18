# Changelog

All notable changes to this project's skills. Follows [Keep a Changelog](https://keepachangelog.com/) conventions; generated from changesets.

## [1.0.0] - 2026-08-18

### Added

- **ci-fix-dont-freeze** — Fix CI/lint/type errors as clues of unfinished, unwired, or broken code. No baseline-freeze, no suppression, no "out of scope"; trace to root and wire it.
- **worker-reasoning-discipline** — Internal reasoning checks (restate, seam-audit, mark-settle, verify-before-done, coverage) that complement external quality gates.
- **j-space** — Inner-workspace reasoning suite: pass gating, seam audit, and a `Goal / Core / Verified / Open / Next` ledger with optional controller.
- Repo scaffold modeled after mattpocock/skills: README, CLAUDE.md/AGENTS.md, CONTEXT.md, docs/, .claude-plugin, scripts/, GitHub release workflow, .changeset.
