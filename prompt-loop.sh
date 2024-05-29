#! /usr/bin/env bash
# A simple hard coded prompt loop for allowing or denying a given prompt for the single
# instance in which it was requested.

noticeTs="$(date '+%FT%T.%NZ')"
prevPromptId="N/A"

while true; do
  echo ":: waiting for next notice..."
  notice=$(
    curl -sS \
      --unix-socket /run/snapd.socket \
      "http://localhost/v2/notices?types=interfaces-requests-prompt&after=$noticeTs&timeout=1h" |
        jq '.result[0]'
  )
  promptId=$(echo "$notice" | jq -r '.key')
  noticeTs=$(echo "$notice" | jq -r '.["last-occurred"]')

  if [[ "$prevPromptId" = "$promptId" ]]; then
    echo "   the notice timestamp gets bumped when we respond so the first notice we"
    echo -e "   get back is the one that we just replied to. Skipping and polling again...\n"
    continue
  else
    prevPromptId="$promptId"
  fi


  prompt=$(
    curl -sS \
      --unix-socket /run/snapd.socket \
      "http://localhost/v2/interfaces/requests/prompts/$promptId" |
        jq '.result'
  )

  promptSnap=$(echo "$prompt" | jq -r '.snap')
  promptTs=$(echo "$prompt" | jq -r '.timestamp')
  promptPath=$(echo "$prompt" | jq -r '.constraints.path')
  promptPerms=$(echo "$prompt" | jq -c '.constraints.permissions')

  echo ":: handling prompt $promptId for $promptSnap"
  echo "   notice timestamp: $noticeTs"
  echo "   prompt timestamp: $promptTs"
  echo "   path: $promptPath"
  echo "   requested permissions: $promptPerms"
  echo ""

  read -r -p "> allow? [y/n]: " confirm; echo
  if [ "$confirm" = "y" ]; then
    action="allow"
  else
    action="deny"
  fi

  resp=$(jq -n \
    --arg action "$action" \
    --arg path "$promptPath" \
    --argjson perms "$promptPerms" \
   '{
      "action": $action,
      "lifespan": "single",
      "constraints": {
        "path-pattern": $path,
        "permissions": $perms
      }
    }'
  )

  echo -e "\nresponse from snapd:"
  curl -sS \
    --unix-socket /run/snapd.socket \
    -d "$resp" \
    "http://localhost/v2/interfaces/requests/prompts/$promptId" |
      jq -c

  echo ""
done
