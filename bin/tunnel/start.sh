#!/bin/bash

# see https://github.com/bbmoz/ngrok-env.

set -ex
set -o pipefail

TUNNEL_DIR=~/workspace/webjs-project-scaffold/bin/tunnel
TUNNEL_API_URL=http://localhost:4040/api/tunnels

# start tunnel
killall ngrok || true
ngrok start app -config ${TUNNEL_DIR}/tunnel.yml &
while ! curl -s ${TUNNEL_API_URL}; do sleep 1; done

# save forwarding address
WEB_TUNNEL_URL=$(curl -s ${TUNNEL_API_URL}/app | jq '.public_url' | tr -d '"')
echo "export WEB_TUNNEL_URL=${WEB_TUNNEL_URL}" > ${TUNNEL_DIR}/tunnel.env
