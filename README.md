# Skills Orchestrator

Orchestrate Cursor agent skills across your GitHub repositories. Maps projects to skills, installs community skills from GitHub, and provides domain-specific agent instructions.

## Quick start

```bash
# Install all recommended skills for Cursor
./scripts/install-skills.sh all

# Install by domain
./scripts/install-skills.sh cloud    # Cloudflare + Composio
./scripts/install-skills.sh ui       # UI/UX skills
./scripts/install-skills.sh android  # Expo/Android skills
```

## Use as Cursor plugin

```bash
git clone https://github.com/axe01010/skills-orchestrator.git
ln -sfn "$(pwd)/skills-orchestrator" ~/.cursor/plugins/local/skills-orchestrator
```

Reload Cursor. Skills auto-discover from `skills/*/SKILL.md`.

## Structure

```
skills-orchestrator/
├── .cursor-plugin/plugin.json   # Plugin manifest
├── orchestrator/
│   ├── manifest.json            # Repo → skill mapping
│   └── sources.json             # GitHub skill sources
├── skills/
│   ├── apk-signer/              # APK Telegram bot
│   ├── android-dev/             # Termux/Cursor on Android
│   ├── github-orchestration/    # Multi-repo + skill install
│   └── portfolio-builder/       # Web/portfolio projects
├── scripts/install-skills.sh
└── REPO_REVIEW.md               # Full repo audit
```

## Bundled skills

| Skill | Triggers on |
|-------|-------------|
| `apk-signer` | APK processing, Xenzen-apk, apk-signer bot |
| `android-dev` | Termux, Ubuntu proot, Cursor on Android |
| `github-orchestration` | Repo review, skill install, new repo creation |
| `portfolio-builder` | SIR-harry, Vercel deploys, portfolio sites |

## External skill sources

Installed via `npx skills add <repo> -a cursor`:

- [vercel-labs/skills](https://github.com/vercel-labs/skills) — skills CLI
- [cloudflare/skills](https://github.com/cloudflare/skills) — Workers/DNS
- [addyosmani/agent-skills](https://github.com/addyosmani/agent-skills) — engineering
- [ComposioHQ/composio-mcp-plugin](https://github.com/ComposioHQ/composio-mcp-plugin) — 1000+ integrations
- [nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill) — UI/UX

## Repo review

See [REPO_REVIEW.md](./REPO_REVIEW.md) for full audit of `axe01010` and `ykrishhh` repositories.

## License

MIT
