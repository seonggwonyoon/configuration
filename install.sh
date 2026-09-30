#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd -P "$(dirname "$0")" && pwd)"
BACKUP="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"
DRY=0
BREW=1

for arg in "$@"; do
  case "$arg" in
    --dry-run) DRY=1 ;;
    --no-brew) BREW=0 ;;
    *) echo "usage: $0 [--dry-run] [--no-brew]" >&2; exit 1 ;;
  esac
done

if ((BREW)); then
  if ((DRY)); then
    brew bundle check --verbose --no-upgrade --file="$ROOT/Brewfile" || true
  else
    brew bundle install --no-upgrade --file="$ROOT/Brewfile"
  fi
fi

cd "$ROOT/home"
find . -type f | while read -r f; do
  f="${f#./}"
  dest="$HOME/$f"
  [[ -L "$dest" && "$(realpath "$dest" 2>/dev/null)" == "$PWD/$f" ]] && continue
  [[ -e "$dest" || -L "$dest" ]] || continue
  echo "backup: ~/$f -> $BACKUP/$f"
  if ((!DRY)); then
    mkdir -p "$BACKUP/$(dirname "$f")"
    mv "$dest" "$BACKUP/$f"
  fi
done

if ((DRY)); then
  exit 0
fi

stow --no-folding --dir="$ROOT" --target="$HOME" --restow home

if ((BREW)); then
  mise install --yes
fi
