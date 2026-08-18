#!/usr/bin/env bash
set -euo pipefail

# NOTE: This is a dev-only script, intended for use by maintainers of this repo.
# It is not a supported installer.
#
# Links all skills in the repository into the local skill directories used by
# each agent harness:
#   - ~/.claude/skills  — Claude Code
#   - ~/.agents/skills  — Codex and other Agent Skills-compatible harnesses
# Each entry is a symlink into this repo, so a `git pull` is all that's needed
# to keep installed skills up to date.

REPO="$(cd "$(dirname "$0")/.." && pwd)"
DESTS=("$HOME/.claude/skills" "$HOME/.agents/skills")

# Collect the repo's skills once, link into every destination.
names=()
srcs=()
while IFS= read -r -d '' skill_md; do
  src="$(dirname "$skill_md")"
  names+=("$(basename "$src")")
  srcs+=("$src")
done < <(find "$REPO/skills" -name SKILL.md -not -path '*/node_modules/*' -not -path '*/deprecated/*' -print0)

for DEST in "${DESTS[@]}"; do
  if [ -L "$DEST" ]; then
    resolved="$(readlink -f "$DEST")"
    case "$resolved" in
      "$REPO"|"$REPO"/*)
        echo "error: $DEST is a symlink into this repo ($resolved)." >&2
        echo "Remove it (rm \"$DEST\") and re-run; the script will recreate it as a real dir." >&2
        exit 1
        ;;
    esac
  fi
  mkdir -p "$DEST"
  # Clear stale links for skills that were removed/renamed.
  for existing in "$DEST"/*; do
    [ -L "$existing" ] || continue
    if [ -d "$existing" ] && ! [[ " ${names[@]} " =~ " $(basename "$existing") " ]]; then
      rm "$existing"
      echo "removed stale link: $existing"
    fi
  done
  for i in "${!names[@]}"; do
    target="$DEST/${names[$i]}"
    if [ -e "$target" ] && [ ! -L "$target" ]; then
      echo "error: $target exists and is not a symlink. Move it aside, then re-run." >&2
      exit 1
    fi
    ln -sfn "${srcs[$i]}" "$target"
    echo "linked ${names[$i]} -> $target"
  done
done
echo "Done."
