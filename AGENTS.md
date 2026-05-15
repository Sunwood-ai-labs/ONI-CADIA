# ONI-CADIA Agent Operations

## Agent Usage

- Use `/Users/admin/.codex/skills/codex-spark-eclipse-legion/SKILL.md` when the task genuinely benefits from Spark subagents.
- If GPT-5.3-Codex-Spark is unavailable and delegation is still useful, use `/Users/admin/.codex/skills/cc-orchestrator-cli-skill/SKILL.md` as the fallback.
- Keep small, single-surface fixes local when delegation would add coordination overhead.

## Source Of Truth

- The local repository at `/Users/admin/Prj/ONI-CADIA` is the source of truth.
- The SSH target `vm200:/home/maki/codex-workspace/ARCADIA` is a deployment/runtime copy.
- Do not treat files edited directly on `vm200` as canonical. Bring intentional runtime discoveries back into the local repo, review them locally, then commit and push.
- Keep unrelated local work, especially untracked artifacts under `tmp/`, out of operational commits unless the user explicitly asks to include them.

## Deploy Flow

1. Make code, docs, and configuration changes in the local repository.
2. Run the relevant local checks before publishing, for example:

   ```sh
   uv run python -m unittest discover -s tests
   npm --prefix docs run docs:build
   python3 -m compileall -q src scripts/mattermost_tools
   git diff --check
   ```

3. Commit and push each meaningful change when the user has requested continuous commit/push operation.
4. Update the deployed copy on `vm200` from Git:

   ```sh
   ssh vm200 'cd /home/maki/codex-workspace/ARCADIA && git fetch origin main && git reset --hard origin/main'
   ```

5. Apply runtime-only generated helper syncs when needed, such as refreshed `.openclaw/instances/*/mattermost-tools` copies or non-versioned `.env` values. Prefer narrow `rsync` or explicit file copies over broad overwrites.
6. Verify the live runtime from both sides:

   ```sh
   curl -sS -o /dev/null -w "lan %{http_code}\n" http://192.168.11.200:8065/openclaw/channels/origin-square
   ssh vm200 'cd /home/maki/codex-workspace/ARCADIA && podman ps --format "{{.Names}}\t{{.Status}}"'
   ```

## Mattermost Runtime

- LAN entrypoint: `http://192.168.11.200:8065/openclaw/channels/origin-square`
- The public Cloudflare quick tunnel may change after service restarts; read the current URL from the `oni-cadia-mattermost-cloudflare.service` log before reporting it.
- The Mattermost display name may remain Japanese even when the URL slug is English.
- Current channel slug policy: use `origin-square` for the main public square, displayed as `はじまりの広場`.

## Reset Discipline

- Before resetting Mattermost/OpenClaw state, preserve any civilization record the user asks to keep under `docs/` first.
- After a reset, preserve only the intentionally retained identity inputs, such as names and model assignments, unless the user says otherwise.
- Rebuild agent personality and civilization from post-reset interaction rather than old chat history.
