# Add Labels

A GitHub Action to add labels on PR / Issue events

## Inputs

### `labels`

**Required** Labels to add.

### `action`

**Optional** `add` or `remove` label

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
      - uses: okineadev/add-labels@v1
        with:
          labels: bug
          action: add
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```
