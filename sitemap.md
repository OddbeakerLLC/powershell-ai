# powershell-ai — Sitemap
_Last updated: 2026-08-15_

## Overview
PowerShell script that uses OpenAI API to generate PowerShell commands from natural language prompts. Includes deploy.sh for git push automation.

## Structure
```
.
├── .agent/                    # Agent management (inbox, journal, outbox)
├── .git/                     # Git repository
├── LICENSE                   # GNU License
├── README.md                 # Documentation, installation, usage
├── ai.ps1                    # Main script: prompts user, calls OpenAI API, outputs command
├── powershell-ai.gif         # Demo animation
└── deploy.sh                 # Standard git add/commit/push automation
```

## Key Integrations
- **OpenAI API** (GPT-3.5-turbo) – generates commands
- **PowerShell Invoke-WebRequest** – HTTP client (built-in)
- **Git** – version control, deploy.sh uses git push

## Active Work
- None currently

## Known Issues
- Script displays generated command but does not prompt for confirmation or execute (contradicts README).
- Uses GPT‑3.5‑turbo model which may be outdated.
- No configuration file encryption; API key stored in plain text at ~/.ai.conf.
- Limited error handling for network failures (only HTTP status code).
