# Encrypted Energy — OpenClaw Skills

Hosted uptime monitoring for OpenClaw agents.

## encryptedenergy-uptime

Know when your agent goes down before your users do.

- Pings your gateway's `/health` endpoint every minute
- Reports to encryptedenergy.com
- Public status page at `encryptedenergy.com/agent/your-slug`
- Email alerts when pings stop

### Install

```
openclaw skills install encryptedenergy-uptime
```

### Setup

1. Sign up at [encryptedenergy.com](https://encryptedenergy.com)
2. Register an agent at [encryptedenergy.com/agents/new](https://encryptedenergy.com/agents/new) — you'll get a bearer token tied to that agent
3. `openclaw config set env.vars.ENCRYPTED_ENERGY_API_KEY <your-token>` — then `openclaw gateway restart` so the new env var is picked up

### Roadmap

- Telegram, Discord, and webhook alert channels (currently email only)
- Bitcoin-anchored uptime proofs via OpenTimestamps (paid tier)

### Learn more

[encryptedenergy.com](https://encryptedenergy.com)
