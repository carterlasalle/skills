# Writing docs pages

Every skill in `engineering/` has a human-facing docs page at `docs/engineering/<skill-name>.md` — the docs tree mirrors the bucket folder under `skills/`. The page is not the skill and not a copy of `SKILL.md`; it orients one reader around one skill.

Act whenever a promoted skill is added, renamed, or has its behaviour changed: create or re-sync its docs page. A rename moves the file too. Skills in non-promoted buckets get no page.

## Page structure

Four sections make a page worth reading, in this order:

- **`## What it does`** — one or two plain-language paragraphs. Lead with the skill's one-sentence job, then state the **defining constraint** (the single fact that makes it behave differently from the obvious default).
- **`## When to reach for it`** — invocation mode (type it vs. agent fires it) and the trigger boundary. Use a table for multi-way choices.
- **`## Common questions`** — real questions readers ask, each in bold with the answer beneath. Omit where there is nothing worth answering.
- **`## It's working if`** — a few bullets the reader can check without opening `SKILL.md`.
- **`## Where it fits`** — situate the skill in the system: its role and its neighbours.

## Conventions

- Explain the **why**, not the process. The page orients and situates the skill; it never reproduces the `SKILL.md` steps.
- Never name the author. State the substance as a plain claim about the skill.
- Branches go in a table or a list, never in a paragraph.
- Keep the page low-load. Furniture is the thing it is arguing against.

## Done when

- The page exists at `docs/engineering/<name>.md`.
- `## What it does` states the defining constraint.
- `## When to reach for it` states invocation mode + trigger boundary.
- `## Where it fits` is present.
- Every link resolves (repo-relative is fine here — these pages aren't published to a separate site).
