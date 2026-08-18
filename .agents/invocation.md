# Model-invoked vs user-invoked

Every skill in this repo is model-invoked by default (reachable by you or the agent). This is the right default for the current set: each skill is a reusable *discipline* the agent should be able to reach for autonomously when a task fits.

- **Model-invoked** — reachable by model or user. The default: omit `disable-model-invocation` and the `policy` block from `agents/openai.yaml`. The `description` is **model-facing** and keeps rich trigger phrasing so auto-invocation fires.
- **User-invoked** — reachable only when the human types it. Set `disable-model-invocation: true` in the frontmatter and `policy.allow_implicit_invocation: false` in `agents/openai.yaml`. Use this for orchestration skills you always want to fire deliberately.

Each skill carries an `agents/openai.yaml` with Codex UI metadata (`interface.display_name`, `interface.short_description`). Keep the two in sync: a skill is user-invoked in both harnesses or neither.

A user-invoked skill may invoke model-invoked skills via the Skill tool, but can never reach another user-invoked skill.
