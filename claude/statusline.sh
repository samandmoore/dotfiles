#!/bin/bash
input=$(cat)

MODEL=$(echo "$input" | jq -r '.model.id')
DIR=$(echo "$input" | jq -r '.workspace.current_dir')
COST=$(echo "$input" | jq -r '.cost.total_cost_usd // 0')
PCT=$(echo "$input" | jq -r '.context_window.used_percentage // 0' | cut -d. -f1)
EFFORT=$(echo "$input" | jq -r '.effort.level // empty')
# Share of the last API call's input tokens that were cache hits
CACHE=$(echo "$input" | jq -r '.context_window.current_usage
  | if . == null then empty
    else (.input_tokens + .cache_creation_input_tokens + .cache_read_input_tokens) as $t
      | if $t == 0 then empty else (.cache_read_input_tokens * 100 / $t | round) end
    end')

CYAN='\033[36m'
GREEN='\033[32m'
YELLOW='\033[33m'
RED='\033[31m'
RESET='\033[0m'

# Pick bar color based on context usage
if [ "$PCT" -ge 90 ]; then
  BAR_COLOR="$RED"
elif [ "$PCT" -ge 70 ]; then
  BAR_COLOR="$YELLOW"
else BAR_COLOR="$GREEN"; fi

BRANCH=""
git rev-parse --git-dir >/dev/null 2>&1 && BRANCH=" | 🌿 $(git branch --show-current 2>/dev/null)"

COST_FMT=$(printf '$%.2f' "$COST")

[ -n "$EFFORT" ] && EFFORT=" | ⚡ ${CYAN}${EFFORT}${RESET}"

if [ -n "$CACHE" ]; then
  if [ "$CACHE" -ge 80 ]; then
    CACHE_COLOR="$GREEN"
  elif [ "$CACHE" -ge 50 ]; then
    CACHE_COLOR="$YELLOW"
  else CACHE_COLOR="$RED"; fi
  CACHE=" | 📦 ${CACHE_COLOR}${CACHE}%${RESET}"
fi

echo -e "${CYAN}$MODEL${RESET}$EFFORT | 🧠 ${BAR_COLOR}${PCT}%${RESET}$CACHE | 💰 ${YELLOW}${COST_FMT}${RESET} | 📁 ${DIR##*/}$BRANCH "
