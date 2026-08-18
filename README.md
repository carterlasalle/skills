# Skills — Independent Skills Collection

[![skills.sh](https://skills.sh/b/carterlasalle/skills)](https://skills.sh/carterlasalle/skills)

An **independent** collection of agent skills I build and maintain directly — not a fork of the Coding Hermes fleet skills (that lives at [`carterlasalle/coding-hermes-skills`](https://github.com/carterlasalle/coding-hermes-skills)). These skills encode disciplines I actually use: fixing CI the right way, keeping an agent's reasoning honest on long work, and carrying state through multi-turn tasks.

They're small, self-contained, and composable. They work with any model. Hack around with them, make them your own, enjoy.

## Installation (30-second setup)

Two ways in, two philosophies. The **Claude Code plugin** installs the whole set as a managed, read-only bundle that updates when I ship — you subscribe rather than fork. **[skills.sh](https://skills.sh/carterlasalle/skills)** copies editable skill files into your project, so you can hack on them and make them your own. Pick one — installing both leaves you with every skill twice.

### 1. Get the skills

<details>
<summary><strong>Claude Code</strong></summary>

```bash
claude plugins install carterlasalle-skills
```

Or, from inside a session:

```
/plugin install carterlasalle-skills
```

Add the marketplace first (this repo is its own single-plugin marketplace), then install:

```
/plugin marketplace add carterlasalle/skills
/plugin install carterlasalle-skills@carterlasalle
```

</details>

<details>
<summary><strong>Codex, and other agents</strong></summary>

```bash
npx skills@latest add carterlasalle/skills
```

Pick the skills you want, and which coding agents to install them on.

</details>

<details>
<summary><strong>For tinkerers</strong></summary>

Use the same installer, on any agent — including Claude Code:

```bash
npx skills@latest add carterlasalle/skills
```

It writes the skills into your repo as ordinary files you own and can edit. Nothing updates behind your back; pull my latest changes when you want them with `npx skills update`.

</details>

### 2. Bam - you're ready to go.

## Why These Skills Exist

### #1: The Agent Didn't Do What I Want

**The Problem**. The most common failure mode is misalignment — the agent built *something*, but not *the thing*. The fix is making the agent actually verify the goal before it claims done.

**The discipline** is built into each skill:
- [`/worker-reasoning-discipline`](./skills/engineering/worker-reasoning-discipline/SKILL.md) — restate the goal in one line, audit at seams, mark-and-settle catches, verify before you say finished.
- [`/j-space`](./skills/engineering/j-space/SKILL.md) — fuller version: pass gating (`fast`/`full`/`loop`) and a `Goal / Core / Verified / Open / Next` ledger that keeps state alive across long work.

### #2: CI Errors Were Treated As Nuisances

**The Problem**: Lint and type-check errors get suppressed or "baselined away" to make CI green — and every suppressed error is real unfinished or unwired code that gets lost forever.

**The Fix** is [`/ci-fix-dont-freeze`](./skills/engineering/ci-fix-dont-freeze/SKILL.md). It makes the "get CI green" task into a root-cause fix: trace every error to its intent, wire the missing caller, never baseline or `ignore` a fixable cause, and let scope creep in — because an untouched error is an error that will never be fixed.

This is my most important skill. It's the difference between green-as-ceremony and green-as-truth.

### #3: Long Work Loses Its Thread

**The Problem**: Multi-turn, multi-file work drifts. The goal fades in the mechanical middle, state gets re-derived in three branches, and a fluent answer passes for completion.

**The Fix**: [`/j-space`](./skills/engineering/j-space/SKILL.md) carries a small durable ledger (`Goal / Core / Verified / Open / Next`) across seams — re-read at every boundary — so the task state survives tool calls, file switches, and long gaps. [`/worker-reasoning-discipline`](./skills/engineering/worker-reasoning-discipline/SKILL.md) is the lighter, controller-free version for day-to-day worker use.

## Reference

### Engineering

Skills I use for code and agent-reasoning work. These are **model-invoked** — reachable by you *or* reached for automatically by the agent when a task fits.

- **[ci-fix-dont-freeze](./skills/engineering/ci-fix-dont-freeze/SKILL.md)** — Fix CI/lint/type errors as **clues** of unfinished, unwired, broken code. No baseline-freeze, no suppression, no "out of scope." Trace to root, wire it, fix to **zero**, commit + push continuously.
- **[worker-reasoning-discipline](./skills/engineering/worker-reasoning-discipline/SKILL.md)** — Internal reasoning checks: restate, seam-audit, mark-settle, verify-before-done, coverage. Complements external quality gates with in-token discipline.
- **[j-space](./skills/engineering/j-space/SKILL.md)** — Inner-workspace reasoning suite: pass gating, seam audit, and a `Goal / Core / Verified / Open / Next` ledger with an optional controller. The fuller version of the same discipline.

## Related

- [`carterlasalle/coding-hermes-skills`](https://github.com/carterlasalle/coding-hermes-skills) — my fork of the Coding Hermes fleet skills
- [skills.sh](https://www.skills.sh/docs) — the agent skills directory
