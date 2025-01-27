# 🔖 Add or remove labels

A **GitHub Action** to add or remove labels on PRs or issues

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

permissions:
  issues: write
  pull-requests: write

jobs:
  add-label:
    name: 🔖 Add Label

    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v4.2.2
      - uses: okineadev/add-labels@v1.0.5
        with:
          labels: bug,help-needed
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

This GitHub Action is based on the [`gh`](https://github.com/cli/cli) tool without any other dependencies

Additionally, [`gh`](https://github.com/cli/cli) is pre-installed in **GitHub Actions** runners and pre-authenticated

## ❤️ Support

If you like this project, consider supporting it by starring ⭐ it on GitHub, sharing it with your friends, or [buying me a coffee ☕](https://github.com/okineadev/add-labels?sponsor=1)
