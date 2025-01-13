# Add Labels

A GitHub Action to add or remove labels on PR / Issues

## Inputs

### `labels`

**Required** A comma-separated list of labels.

**Example**: `bug,help-needed`

### `action`

**Optional** `add` or `remove` label

**Default**: `add`

**Example**: `add`

## Example usage

```yaml
name: 🔖 Add Label

on: [pull_request_target]

jobs:
  add-label:
    name: 🔖 Add Label

    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v4.2.2
      - uses: okineadev/add-labels@v1.0.2
        with:
          labels: bug,help-needed
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```
