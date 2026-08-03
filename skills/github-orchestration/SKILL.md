---
name: github-orchestration
description: Review GitHub repos, create new repositories, install Cursor skills from GitHub, and map skills to projects. Use when orchestrating multi-repo workflows or plugin installation.
---

# GitHub Orchestration Skill

## Accounts

| Account | Status | Use for |
|---------|--------|---------|
| `axe01010` | Active | New repos, pushes, PRs |
| `ykrishhh` | Suspended | Do not push — appeal ticket #4607208 |

## Install skills from GitHub

### Method 1: skills CLI (recommended)

```bash
npx skills add <owner/repo> -a cursor -y
npx skills add cloudflare/skills -a cursor -y
npx skills list
```

### Method 2: Cursor plugin symlink

```bash
git clone https://github.com/ComposioHQ/composio-mcp-plugin.git
ln -sfn "$PWD/composio-mcp-plugin" ~/.cursor/plugins/local/composio
```

### Method 3: Marketplace

```
/add-plugin composio
```

## Orchestrator manifest

See `orchestrator/manifest.json` for repo → skill mapping and `orchestrator/sources.json` for install sources.

## Install all mapped skills

```bash
./scripts/install-skills.sh all
```

Domain-specific:

```bash
./scripts/install-skills.sh cloud   # Cloudflare + Composio
./scripts/install-skills.sh ui      # UI/UX skills
./scripts/install-skills.sh android # Expo/Android skills
```

## Create new repo workflow

1. Define in `orchestrator/manifest.json` → `suggested_new_repos`
2. `gh repo create <name> --public --description "..."`
3. Add matching skill under `skills/<domain>/SKILL.md`
4. Run `npx skills add . -a cursor` from repo root if plugin format

## Top skill sources

| Repo | Stars | Domain |
|------|-------|--------|
| vercel-labs/skills | CLI hub | General |
| addyosmani/agent-skills | 81k+ | Engineering |
| cloudflare/skills | 2.5k+ | Workers/DNS |
| ComposioHQ/composio-mcp-plugin | — | 1000+ app integrations |
| wshobson/agents | 38k+ | Multi-agent orchestration |
