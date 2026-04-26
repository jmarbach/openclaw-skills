# Encrypted Energy — OpenClaw Skills

Hosted uptime monitoring for OpenClaw agents.

## encryptedenergy-uptime

Know when your agent goes down before your users do. 

- Pings your gateway's `/health` endpoint every 5 minutes
- Reports to encryptedenergy.com
- Status page at `encryptedenergy.com/your-agent`
- Alerts via Telegram, Discord, or email when pings stop
- Optional Bitcoin-anchored uptime proofs via OpenTimestamps

### Install
```
openclaw skills install encryptedenergy-uptime
```

### Setup

1. Sign up at [encryptedenergy.com](https://encryptedenergy.com)
2. Copy your API key
3. `openclaw secrets set ENCRYPTED_ENERGY_API_KEY <your-key>`

### Learn more

[encryptedenergy.com](https://encryptedenergy.com)
