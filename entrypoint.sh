#!/bin/sh
# Fix ownership of Railway volume mount (mounted as root at runtime)
mkdir -p /data/.openclaw /data/workspace
chown -R node:node /data

# Drop to node user and exec the gateway
exec su -s /bin/sh node -c 'exec node /app/openclaw.mjs gateway --bind lan --port 8080 --allow-unconfigured'
