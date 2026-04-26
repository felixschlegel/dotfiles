#!/bin/sh

payload="${1:-}"
if [ -z "$payload" ]; then
  payload="$(cat)"
fi

if [ -z "$payload" ]; then
  exit 0
fi

event="$(printf '%s' "$payload" | jq -r '.hook_event_name // .type // empty' 2>/dev/null || true)"
cwd="$(printf '%s' "$payload" | jq -r '.cwd // empty' 2>/dev/null || true)"
folder="$(basename "${cwd:-$PWD}")"
title="Codex - $folder"

notify() {
  body="$1"
  speech="$2"

  osascript \
    -e 'on run argv' \
    -e 'display notification (item 1 of argv) with title (item 2 of argv)' \
    -e 'end run' \
    "$body" "$title" >/dev/null 2>&1 || true

  say "$speech" >/dev/null 2>&1 || true
}

case "$event" in
  Stop|agent-turn-complete)
    notify "Codex is done" "Codex is done in $folder"
    ;;
  PermissionRequest)
    notify "Waiting for input" "Codex needs input in $folder"
    ;;
esac

exit 0
