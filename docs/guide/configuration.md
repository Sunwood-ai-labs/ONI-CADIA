# Configuration

## Core Environment Variables

- `OPENCLAW_IMAGE`: OpenClaw image to run
- `OPENCLAW_PODMAN_PUBLISH_HOST`: host publish address
- `OPENCLAW_OLLAMA_BASE_URL`: Ollama native API URL
- `OPENCLAW_OLLAMA_MODEL`: default Ollama model id
- `OPENCLAW_MODEL_REF`: provider-qualified model reference such as `zai/glm-5.1`, `ollama/gemma4:e2b`, `google/gemma-4-31b-it`, or `nvidia/moonshotai/kimi-k2.6`
- `OPENCLAW_MODEL_FALLBACKS`: comma-separated fallback model refs; leave it empty for providers that should not inherit Z.AI fallbacks
- `OPENCLAW_ZAI_BASE_URL`, `OPENCLAW_OPENROUTER_BASE_URL`, `OPENCLAW_NVIDIA_BASE_URL`: provider endpoints used when the selected model ref targets those providers
- `OPENCLAW_SCALE_INSTANCE_ROOT`: root directory for generated instances
- `OPENCLAW_SCALE_GATEWAY_PORT_START`: first gateway port
- `OPENCLAW_SCALE_BRIDGE_PORT_START`: first bridge port
- `OPENCLAW_SCALE_PORT_STEP`: per-instance port increment

Provider API keys stay in `.env` and are injected by provider name. The currently supported keys are `ZAI_API_KEY`, `OPENROUTER_API_KEY`, `GEMINI_API_KEY`, and `NVIDIA_API_KEY`.

## Agent-Team Tuning

These env vars control the communication lab:

- `OPENCLAW_MATTERMOST_ENABLED`
- `OPENCLAW_MATTERMOST_CHANNEL_NAME`
- `OPENCLAW_MATTERMOST_AUTONOMY_ENABLED`
- `OPENCLAW_MATTERMOST_AUTONOMY_INTERVAL`
- `OPENCLAW_MATTERMOST_AUTONOMY_INTERVAL_INSTANCE_00N`
- `OPENCLAW_MATTERMOST_AUTONOMY_MODEL`
- `OPENCLAW_MODEL_REF_INSTANCE_00N`
- `OPENCLAW_MODEL_FALLBACKS_INSTANCE_00N`
- `OPENCLAW_MATTERMOST_AUTONOMY_MODEL_INSTANCE_00N`

Most team behavior still lives in the workspace scaffolds rather than env vars. Use `.env` for infrastructure defaults, then tune `SOUL.md`, `IDENTITY.md`, `USER.md`, and `HEARTBEAT.md` inside each generated workspace.

Per-instance model overrides let the same team mix providers. `.env.example` includes examples for Google/Gemma seats 4-6 and optional NVIDIA seats 7-9; use those with `--count 9` only when the matching provider keys are available.

## Important Note For Windows + WSL Podman

The working Ollama endpoint observed during validation was:

```text
http://172.27.208.1:11434
```

If `host.containers.internal` does not reach the Windows-hosted Ollama instance in your environment, replace `OPENCLAW_OLLAMA_BASE_URL` accordingly.

## Trust Model

This project targets same-trust operator workflows. OpenClaw is configured in a full-access-in-container mode and depends on the Podman pod boundary rather than OpenClaw's internal sandbox for the main isolation layer.
