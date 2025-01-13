#!/usr/bin/env bash

if [[ ! -n "$GITHUB_TOKEN" ]]; then
  echo "Error: GITHUB_TOKEN is not set"
  exit 1
fi

ISSUE_NUMBER="$1"
ACTION="$2"

# Read labels from input
LABELS="$3"
if [[ ! -n "$LABELS" ]]; then
  echo "Error: No labels provided"
  exit 1
fi

# Add labels using gh cli
gh issue edit "$ISSUE_NUMBER" --$ACTION-label "$LABELS"

if [[ $? -eq 0 ]]; then
  [[ $ACTION == "add" ]] && echo "✅ Added labels \"$LABELS\" for #$ISSUE_NUMBER"
  [[ $ACTION == "remove" ]] && echo "✅ Removed labels \"$LABELS\" from #$ISSUE_NUMBER"
else
  [[ $ACTION == "add" ]] && echo "Error: Failed to add labels \"$LABELS\" for #$ISSUE_NUMBER"
  [[ $ACTION == "remove" ]] && echo "Error: Failed to remove labels \"$LABELS\" from #$ISSUE_NUMBER"
  exit 1
fi

exit 0
