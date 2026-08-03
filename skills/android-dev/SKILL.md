---
name: android-dev
description: Android development on rooted devices — Termux, proot Ubuntu, Cursor CLI, fastboot, boot loop recovery. Use for Nothing Phone, Termux setup, or mobile dev environment tasks.
---

# Android Dev Skill

## Environments

| Layer | Tool | Notes |
|-------|------|-------|
| Shell | Termux | Base on Android |
| Linux | proot-distro Ubuntu (resolute) | `ubuntu` command |
| GUI | Termux:X11 | `export DISPLAY=:0` |
| Cursor IDE | cursor.sh installer | Needs X11, ARM may be limited |
| Cursor CLI | `curl https://cursor.com/install -fsS \| bash` | Command is `agent` |

## Termux setup

```bash
pkg update && pkg upgrade -y
pkg install proot-distro termux-x11-nightly wget curl git -y
proot-distro install ubuntu
```

## Fix apt sources (resolute ARM)

```bash
sudo tee /etc/apt/sources.list > /dev/null <<'EOF'
deb http://ports.ubuntu.com/ubuntu-ports/ resolute main restricted universe multiverse
deb http://ports.ubuntu.com/ubuntu-ports/ resolute-updates main restricted universe multiverse
deb http://ports.ubuntu.com/ubuntu-ports/ resolute-backports main restricted universe multiverse
deb http://ports.ubuntu.com/ubuntu-ports/ resolute-security main restricted universe multiverse
EOF
sudo rm -rf /etc/apt/sources.list.d/*
sudo apt update
```

## Copy files Termux → Ubuntu

```bash
# Inside Ubuntu
cp /data/data/com.termux/files/home/cursor.sh ~/cursor.sh
chmod +x ~/cursor.sh
```

## Related repo

`axe01010/nothing-phone-bootloop-recovery` — Nothing Phone 3a boot loop fix via stock boot image flash.
