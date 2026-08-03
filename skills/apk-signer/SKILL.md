---
name: apk-signer
description: Build, obfuscate, and sign Android APKs via the Telegram bot pipeline (AndResGuard, apktool, zipalign). Use when working on apk-signer, Xenzen-apk, or Android packaging tasks.
---

# APK Signer Skill

## Project

- **Repo:** `Axeb2b/apk-signer` (workspace: `/workspace`)
- **Stack:** Python, python-telegram-bot, Docker, Java 17, apktool, AndResGuard

## Pipeline

1. Receive APK via Telegram (`BOT_TOKEN` env required)
2. AndResGuard resource obfuscation
3. apktool decompile → inject dummy asset → rebuild
4. Generate random keystore → sign → zipalign
5. Return modified APK to user

## Key files

| File | Purpose |
|------|---------|
| `bot.py` | Telegram handler and pipeline |
| `Dockerfile` | Container with Java, apktool, AndResGuard |
| `requirements.txt` | `python-telegram-bot==20.7` |

## Commands

```bash
export BOT_TOKEN=your_token
pip install -r requirements.txt
python bot.py
```

Docker:

```bash
docker build -t apk-signer .
docker run -e BOT_TOKEN=... apk-signer
```

## Related repos

- `axe01010/Xenzen-apk` — APK distribution
- `axe01010/nothing-phone-bootloop-recovery` — Android recovery docs
