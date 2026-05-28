#!/usr/bin/env sh
set -eu

STATE_DIR="${OPENCLAW_STATE_DIR:-/home/node/.openclaw}"
CITIZEN_HANDLE="${OPENCLAW_CITIZEN_HANDLE:-azusa}"
CITIZEN_DISPLAY_NAME="${OPENCLAW_CITIZEN_DISPLAY_NAME:-あずさ}"
CITIZEN_INSTANCE="${OPENCLAW_CITIZEN_INSTANCE:-10}"
mkdir -p "$STATE_DIR"
cp -R /opt/oni-cadia-openclaw-state/. "$STATE_DIR/"

if [ "$CITIZEN_HANDLE" != "azusa" ] || [ "$CITIZEN_INSTANCE" != "10" ]; then
  sed -i \
    -e "s/azusa/${CITIZEN_HANDLE}/g" \
    -e "s/あずさ/${CITIZEN_DISPLAY_NAME}/g" \
    -e "s/--instance 10/--instance ${CITIZEN_INSTANCE}/g" \
    -e "s/10: \"${CITIZEN_HANDLE}\"/${CITIZEN_INSTANCE}: \"${CITIZEN_HANDLE}\"/g" \
    "$STATE_DIR/openclaw.json" \
    "$STATE_DIR/workspace/HEARTBEAT.md" \
    "$STATE_DIR/workspace/IDENTITY.md" \
    "$STATE_DIR/workspace/SOUL.md" \
    "$STATE_DIR/mattermost-tools/common_runtime.py"
fi

cat > "$STATE_DIR/.env" <<EOF
OPENAI_API_KEY=${AZURE_OPENAI_API_KEY:-}
AZURE_OPENAI_API_KEY=${AZURE_OPENAI_API_KEY:-}
OPENCLAW_MATTERMOST_BOT_TOKEN=${OPENCLAW_MATTERMOST_BOT_TOKEN:-}
OPENCLAW_MATTERMOST_TEAM_NAME=${OPENCLAW_MATTERMOST_TEAM_NAME:-openclaw}
OPENCLAW_MATTERMOST_CHANNEL_NAME=${OPENCLAW_MATTERMOST_CHANNEL_NAME:-origin-square}
OPENCLAW_MODEL_REF=${OPENCLAW_MODEL_REF:-azure-openai/gpt-5-mini-citizen}
EOF

exec openclaw gateway --allow-unconfigured
