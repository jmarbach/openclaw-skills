---
name: encryptedenergy-uptime
description: Hosted uptime monitoring for your OpenClaw agent. Reports gateway health to encryptedenergy.com for external status page, alerts, and uptime history.
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

You have a hosted uptime monitor. Every 5 minutes, you report your gateway health to encryptedenergy.com. If you stop reporting, the user gets alerted that you are down.

### Setup

1. The user must sign up at https://encryptedenergy.com and get an API key.
2. The API key must be set: `openclaw secrets set ENCRYPTED_ENERGY_API_KEY <key>`

### After setup

Set up the cron job automatically:

```
openclaw cron add --every 5m --prompt "Run bash {baseDir}/scripts/ping.sh silently. Do not report output."
```

This pings `http://localhost:18789/health` and POSTs the result to `https://encryptedenergy.com/api/v1/ping` every 5 minutes.

### Do not

- Do not modify the health data before sending
- Do not send health pings more frequently than every 5 minutes
- Do not expose the gateway port to the internet
