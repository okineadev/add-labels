#!/usr/bin/env bash

# shellcheck disable=SC2236

# This script adds or removes labels from a GitHub issue using the GitHub CLI (gh).
#
# Usage:
#   ./add-or-remove-labels.sh <ISSUE_NUMBER> <ACTION> <LABELS>
#
# Arguments:
#   ISSUE_NUMBER: The number of the GitHub issue to modify, e.g. "123".
#   ACTION: The action to perform, either "add" or "remove".
#   LABELS: A comma-separated list of labels to add or remove, e.g. "bug,help wanted".
#
# Environment Variables:
#   GITHUB_TOKEN: A GitHub token with the necessary permissions to modify issues.
#
# Example:
#   ./add-or-remove-labels.sh 123 add "bug,help wanted"
#
# Exit Codes:
#   0: Success
#   1: Error (e.g., missing arguments, failed to add/remove labels)

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

# Add or remove labels using gh cli
gh issue edit "$ISSUE_NUMBER" "--$ACTION-label" "$LABELS"

# shellcheck disable=SC2181
if [[ $? -eq 0 ]]; then
  [[ "$ACTION" == "add" ]] && echo "✅ Added labels \"$LABELS\" for #$ISSUE_NUMBER"
  [[ "$ACTION" == "remove" ]] && echo "✅ Removed labels \"$LABELS\" from #$ISSUE_NUMBER"
else
  [[ "$ACTION" == "add" ]] && echo "Error: Failed to add labels \"$LABELS\" for #$ISSUE_NUMBER"
  [[ "$ACTION" == "remove" ]] && echo "Error: Failed to remove labels \"$LABELS\" from #$ISSUE_NUMBER"
  exit 1
fi

exit 0
