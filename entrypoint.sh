#!/bin/sh

set -euo pipefail

# for backwards compatibility, seperates host and port from url
export FRONTEND_DOMAIN=${FRONTEND_DOMAIN:-${FRONTEND_HOST%:*}}
export FRONTEND_PORT=${FRONTEND_PORT:-${FRONTEND_HOST##*:}}

export BACKEND_DOMAIN=${BACKEND_DOMAIN:-${BACKEND_HOST%:*}}
export BACKEND_PORT=${BACKEND_PORT:-${BACKEND_HOST##*:}}
export S3_BUCKET=${S3_BUCKET:-blank}
export S3_REGION=${S3_REGION:-ap-southeast-1}

# strip https:// or https:// from domain if necessary
FRONTEND_DOMAIN=${FRONTEND_DOMAIN##*://}
BACKEND_DOMAIN=${BACKEND_DOMAIN##*://}

echo using frontend: ${FRONTEND_DOMAIN} with port: ${FRONTEND_PORT}
echo using backend: ${BACKEND_DOMAIN} with port: ${BACKEND_PORT}

exec caddy run --config Caddyfile --adapter caddyfile 2>&1