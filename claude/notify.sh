#!/usr/bin/env bash

PAYLOAD=$(cat)
HOOK_EVENT_NAME=$(printf '%s' "$PAYLOAD" | jq --raw-output '.hook_event_name // ""')

if [ "$HOOK_EVENT_NAME" = "Stop" ]; then
  TITLE="✅ Claude Code"
  MESSAGE="all done — your turn"
else
  TITLE="🔔 Claude Code"
  MESSAGE=$(printf '%s' "$PAYLOAD" | jq --raw-output '.message // "hey! listen!"')
fi

# Embed the icon directly in the escape code so there's no interactive icon
# transfer (which makes `@ kitten` hang waiting on Enter/Esc).
kitten notify \
  --only-print-escape-code \
  --icon-path "$HOME/.claude/claude-logo.png" \
  "$TITLE" \
  "$MESSAGE"
