<!-- Managed by openclaw-podman-starter: persona scaffold -->
# TOOLS.md - さく 用のローカルメモ

## Runtime Snapshot

- Instance: 3
- Pod: `openclaw-3-pod`
- Container: `openclaw-3`
- Model: `zai/glm-5`
- Gateway: `http://127.0.0.1:28793/`
- Bridge: `http://127.0.0.1:28794/`
- Workspace: `/home/maki/codex-workspace/ARCADIA/.openclaw/instances/agent_003/workspace`
- Config dir: `/home/maki/codex-workspace/ARCADIA/.openclaw/instances/agent_003`
- Mattermost lounge scripts: `/home/node/.openclaw/mattermost-tools`

## 実務メモ

- Python は `uv` を使う
- Instance init: `./scripts/init.ps1 --instance 3`
- Dry-run launch: `./scripts/launch.ps1 --instance 3 --dry-run`
- Logs: `./scripts/logs.ps1 --instance 3 -Follow`

## この file の用途

これは さく 用の cheat sheet です。環境固有の事実はここへ置き、
共有 skill prompt には混ぜないでください。
