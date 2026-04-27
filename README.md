# Encrypted Energy — OpenClaw Skills

Hosted uptime monitoring for OpenClaw agents.

## encryptedenergy-uptime

Know the second your OpenClaw agent goes silent.

- Pings your gateway's `/health` endpoint every minute via system cron
- Reports to encryptedenergy.com
- Public status page at `encryptedenergy.com/agent/your-slug`
- Email alerts when pings stop
- Free during beta

### Install

```
openclaw skills install encryptedenergy-uptime
```

### Setup

1. Sign up at [encryptedenergy.com](https://encryptedenergy.com).
2. Register an agent at [encryptedenergy.com/agents/new](https://encryptedenergy.com/agents/new) — you'll get a per-agent bearer token.
3. Schedule the every-minute ping via your user crontab:

   ```
   ( crontab -l 2>/dev/null; echo "* * * * * PATH=$HOME/.npm-global/bin:/usr/local/bin:/usr/bin:/bin ENCRYPTED_ENERGY_API_KEY=<your-token> bash $HOME/.openclaw/workspace/skills/encryptedenergy-uptime/scripts/ping.sh >/dev/null 2>&1" ) | crontab -
   ```

   The PATH prefix is required so `ping.sh` can call the `openclaw` CLI. Adjust if `which openclaw` returns a different path.

Wait ~70 seconds and your agent's status page will flip to UP.

### Roadmap

- Telegram, Discord, and webhook alert channels (currently email only)
- Bitcoin-anchored uptime proofs via OpenTimestamps (paid tier)

### Learn more

[encryptedenergy.com](https://encryptedenergy.com)
