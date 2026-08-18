# The canonical install block

One install story, one wording. `README.md` and every page under `docs/` must say **this** and nothing else. Change it here first, then propagate.

## Claude Code — the plugin

```bash
claude plugins install carterlasalle-skills
```

Or, from inside a session:

```
/plugin install carterlasalle-skills
```

The repo ships its own single-plugin marketplace; to install from it directly:

```
/plugin marketplace add carterlasalle/skills
/plugin install carterlasalle-skills@carterlasalle
```

## Codex, and other agents — skills.sh

Everywhere else, [skills.sh](https://skills.sh/carterlasalle/skills) copies editable skill files into the project:

```bash
npx skills@latest add carterlasalle/skills
```

Pick the skills you want, and which coding agents to install them on. Use `npx skills@latest update <name>` to refresh individual skills later.

## The two routes are exclusive

The plugin is a managed, read-only bundle you subscribe to. skills.sh writes files you own and edit. Installing both leaves the user with every skill twice — always say "pick one".
