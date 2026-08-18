# Carter's Skills

An independent collection of agent skills I build and maintain directly — not a fork of the Coding Hermes fleet skills. These encode the disciplines I actually use when writing code, fixing CI, and running long agent work.

## Language

**Fix-don't-freeze**:
The philosophy that a CI, lint, or type-check error is a clue to unfinished, unwired, or broken code — never a nuisance to suppress or baseline away. Fix it at the root so it is finished, wired, and green.
_Avoid_: papering over, freezing a backlog, ignoring-to-green

**Seam audit**:
A check run at task boundaries (tool call, file write, build fires, "done" claimed) that catches goal-drift, contradiction, and missing coverage.
_Avoid_: mid-phrase auditing

**Trace before deleting**:
Following a symbol, parameter, or interface through its callers and specs to discover its intent before removing it — an "extra" parameter is usually a half-implemented feature whose caller isn't wired yet.
_Avoid_: deleting on sight

## Relationships

- `ci-fix-dont-freeze` is the fix-all **philosophy**. `worker-reasoning-discipline` is the moment-to-moment **reasoning checks**. `j-space` is the fuller, ledger-based **reasoning suite**. They are complementary layers of the same discipline.

## Flagged ambiguities

- "skills.sh" refers to the registry (https://skills.sh); "skills.sh.json" is the category-groupings manifest a repo can ship at its root.
