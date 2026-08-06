# 🤖 AI Skills Orchestrator

<p align="center">
  <img src="https://img.shields.io/badge/AI-Skills-blue?style=for-the-badge&logo=openai&logoColor=white" />
  <img src="https://img.shields.io/badge/Cursor-AI-purple?style=for-the-badge&logo=cursor&logoColor=white" />
  <img src="https://img.shields.io/badge/Automation-green?style=for-the-badge" />
</p>

> Orchestrate Cursor agent skills across GitHub repos — install, manage, and share AI agent capabilities.

## 🎯 What It Does

The skills-orchestrator automates:
- 🔍 Discovery of Cursor/Claude Code agent skills across repos
- 📦 Installation of skills into local projects
- 🔄 Sync skills across multiple repos
- 📋 Skill versioning and updates
- 🧪 Testing skill compatibility

## 🚀 Quick Start

```bash
git clone https://github.com/axe01010/skills-orchestrator.git
cd skills-orchestrator

# Install the orchestrator
bash install.sh

# Discover skills in a repo
./orchestrator.sh discover /path/to/repo

# Install skills into current project
./orchestrator.sh install cursor-agents

# Sync skills across repos
./orchestrator.sh sync --repos repo1,repo2,repo3
```

## 📁 Structure

```
skills-orchestrator/
├── orchestrator.sh       # Main CLI tool
├── lib/
│   ├── discover.sh       # Skill discovery
│   ├── install.sh        # Skill installer
│   ├── sync.sh           # Multi-repo sync
│   └── test.sh           # Compatibility testing
├── skills/
│   ├── cursor-agents/    # Cursor agent skills
│   ├── claude-code/      # Claude Code skills
│   └── templates/        # Skill templates
├── CONTRIBUTING.md
├── LICENSE
└── README.md
```

## 🤝 Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md). Contributions welcome:
- New skill packs
- Bug fixes
- Documentation
- New platform support

## 📜 License

MIT License - see [LICENSE](LICENSE)

---

<p align="center">
  Built with ❤️ by <a href="https://github.com/axe01010">axe git</a> · AI-powered automation
</p>
