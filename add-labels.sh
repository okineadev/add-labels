#!/usr/bin/env bash

if [ -z "$GITHUB_TOKEN" ]; then
  echo "Error: GITHUB_TOKEN is not set"
  exit 1
fi

ISSUE_NUMBER="$2"
ACTION="$2"

# Read labels from input
LABELS="$3"
if [ ! -n "$LABELS" ]; then
  echo "Error: No labels provided"
  exit 1
fi

# Add each label using gh cli
echo "$LABELS" | while IFS= read -r label; do
  if [ ! -z "$label" ]; then
    command="$(
      gh issue edit "$ISSUE_NUMBER" --$ACTION-label "$label"
    )"

    if [[ "$command" -eq 0 ]]; then
      [[ $ACTION == "add" ]] && echo "✅ Added label \"$label\" for #$ISSUE_NUMBER"
      [[ $ACTION == "remove" ]] && echo "✅ Removed label \"$label\" from #$ISSUE_NUMBER"
    else
      echo "Error: Failed to $ACTION label $label"
      [[ $ACTION == "add" ]] && echo "Error: Failed to add label \"$label\" for #$ISSUE_NUMBER"
      [[ $ACTION == "remove" ]] && echo "Error: Failed to remove label \"$label\" from #$ISSUE_NUMBER"
      echo "$command"
      exit 1
    fi
  fi
done
