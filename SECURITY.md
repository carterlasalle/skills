# Security

This repository contains agent **skills** — plain-text markdown files (plus a few small scripts) that tell AI agents how to perform tasks. They are not a networked service and store no credentials.

## Reporting a vulnerability

If you believe a skill's instructions or a bundled script could cause harm (e.g. instructions that would lead an agent to take a dangerous or unintended action, a script with a security flaw, or accidental secrets in the repo), **do not** open a public issue.

Please report it privately:

- **Preferred:** create a private security advisory here —
  https://github.com/carterlasalle/skills/security/advisories/new
- Or open a [GitHub security advisory](https://docs.github.com/code-security/security-advisories/guidance-on-reporting-and-writing-information-about-vulnerabilities/privately-reporting-a-security-vulnerability) through the repo's Security tab.

Please include:

- The skill/script affected and the file path
- What a malicious input or misconfiguration could cause
- A suggested fix, if you have one

## What we watch for

- **Prompt-injection hygiene** — skills are instructions, and instructions can be manipulated by untrusted content they process. Reviews check that skills don't blindly trust tool output or third-party text.
- **Script safety** — bundled scripts (`jspace.py`, `verify_suite.py`) should be stdlib-only, not execute arbitrary commands, and not write outside their expected scope.
- **No secrets** — API keys, tokens, and credentials never belong in this repo (they belong in environment config, per the skills' own guidance).
- **No dangerous instructions** — skills that run terminal commands or modify systems must sandbox and warn appropriately.

## Scope

This policy covers this repository only. Installing third-party skills (from skills.sh or any registry) always carries risk — review a skill's `SKILL.md` before installing it, and treat skills as untrusted code until you've read them.
