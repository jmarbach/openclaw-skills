---
name: encryptedenergy-uptime
description: Hosted uptime monitoring for your OpenClaw agent. Reports gateway health to encryptedenergy.com for external status page, email alerts, and uptime history.
metadata:
  openclaw:
    emoji: "⚡"
    requires:
      env:
        - ENCRYPTED_ENERGY_API_KEY
    primaryEnv: ENCRYPTED_ENERGY_API_KEY
    homepage: https://encryptedenergy.com
---

## Encrypted Energy Uptime

You have a hosted uptime monitor. Every minute, you report your gateway health to encryptedenergy.com. If you stop reporting, the user gets an email alert that you are down.

### Setup

1. The user must sign up at https://encryptedenergy.com.
2. The user must register an agent at https://encryptedenergy.com/agents/new — that page reveals a per-agent bearer token (the API key for ping authentication).
3. The API key must be set as a runtime env var: `openclaw config set env.vars.ENCRYPTED_ENERGY_API_KEY <key>` — then restart the gateway with `openclaw gateway restart` so the new env is loaded.

### After setup

Set up the cron job automatically:

```
openclaw cron add --every 1m --name encryptedenergy-uptime-ping --message "Run bash {baseDir}/scripts/ping.sh silently. Do not report output."
```

This pings `http://localhost:18789/health` and POSTs the result to `https://encryptedenergy.com/api/v1/ping` every minute.

### Do not

- Do not modify the health data before sending
- Do not send health pings more frequently than every minute
- Do not expose the gateway port to the internet
