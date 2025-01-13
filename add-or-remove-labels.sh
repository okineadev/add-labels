#!/usr/bin/env bash

if [ -z "$GITHUB_TOKEN" ]; then
  echo "Error: GITHUB_TOKEN is not set"
  exit 1
fi

ISSUE_NUMBER="$1"
ACTION="$2"

# Read labels from input
LABELS="$3"
if [ ! -n "$LABELS" ]; then
  echo "Error: No labels provided"
  exit 1
fi

# Add each label using gh cli
command="$(
  gh issue edit "$ISSUE_NUMBER" --$ACTION-label "$label"
)"

if [[ "$command" -eq 0 ]]; then
  [[ $ACTION == "add" ]] && echo "✅ Added labels \"$label\" for #$ISSUE_NUMBER"
  [[ $ACTION == "remove" ]] && echo "✅ Removed labels \"$label\" from #$ISSUE_NUMBER"
else
  echo "Error: Failed to $ACTION label $label"
  [[ $ACTION == "add" ]] && echo "Error: Failed to add labels \"$label\" for #$ISSUE_NUMBER"
  [[ $ACTION == "remove" ]] && echo "Error: Failed to remove labels \"$label\" from #$ISSUE_NUMBER"
  echo "$command"
  exit 1
fi

exit 0
