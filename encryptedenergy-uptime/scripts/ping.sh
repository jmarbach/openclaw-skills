#!/bin/bash
# encryptedenergy-uptime ping script
# Hits local gateway /health and POSTs result to encryptedenergy.com

HEALTH_URL="http://localhost:18789/health"
PING_URL="https://encryptedenergy.com/api/v1/ping"
API_KEY="${ENCRYPTED_ENERGY_API_KEY}"

if [ -z "$API_KEY" ]; then
  echo "Error: ENCRYPTED_ENERGY_API_KEY not set"
  exit 1
fi

HEALTH=$(curl -s --max-time 5 "$HEALTH_URL" 2>/dev/null)

if [ -z "$HEALTH" ]; then
  HEALTH='{"ok":false,"error":"gateway unreachable"}'
fi

curl -s --max-time 10 \
  -X POST "$PING_URL" \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $API_KEY" \
  -d "$HEALTH" \
  > /dev/null 2>&1