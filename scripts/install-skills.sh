#!/usr/bin/env bash
# Install agent skills from GitHub sources into Cursor.
# Usage: ./scripts/install-skills.sh [all|list|android|cloud|ui]

set -euo pipefail

CURSOR_SKILLS_DIR="${CURSOR_SKILLS_DIR:-$HOME/.cursor/skills}"
PLUGIN_DIR="${CURSOR_PLUGIN_DIR:-$HOME/.cursor/plugins/local}"

log() { echo "[skills-orchestrator] $*"; }

install_skills_cli() {
  local repo="$1"
  local extra_args="${2:-}"
  log "Installing from $repo ..."
  npx --yes skills add "$repo" -a cursor -y $extra_args || log "WARN: failed $repo"
}

install_plugin_symlink() {
  local name="$1"
  local url="$2"
  local dest="$PLUGIN_DIR/$name"
  mkdir -p "$PLUGIN_DIR"
  if [[ -d "$dest" ]]; then
    log "Plugin $name already at $dest"
    return 0
  fi
  local tmp
  tmp=$(mktemp -d)
  git clone --depth 1 "$url" "$tmp"
  ln -sfn "$tmp" "$dest"
  log "Linked plugin $name -> $dest"
}

cmd="${1:-all}"

case "$cmd" in
  list)
    npx --yes skills add vercel-labs/agent-skills --list 2>/dev/null || true
    ;;
  android)
    install_skills_cli "expo/skills" ""
    ;;
  cloud)
    install_skills_cli "cloudflare/skills" ""
    install_plugin_symlink "composio" "https://github.com/ComposioHQ/composio-mcp-plugin.git"
    ;;
  ui)
    install_skills_cli "nextlevelbuilder/ui-ux-pro-max-skill" ""
    install_skills_cli "vercel-labs/agent-skills" "--skill frontend-design"
    ;;
  engineering)
    install_skills_cli "addyosmani/agent-skills" ""
    ;;
  all)
    install_skills_cli "cloudflare/skills" ""
    install_skills_cli "addyosmani/agent-skills" ""
    install_skills_cli "nextlevelbuilder/ui-ux-pro-max-skill" ""
    install_skills_cli "vercel-labs/agent-skills" "--skill frontend-design --skill skill-creator"
    log "Done. List installed: npx skills list"
    ;;
  *)
    echo "Usage: $0 [all|list|android|cloud|ui|engineering]"
    exit 1
    ;;
esac
