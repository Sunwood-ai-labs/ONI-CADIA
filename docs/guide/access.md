# Access

ONI-CADIA's live Mattermost square runs on `vm200`.

## Same-network URL

Use this URL from devices on the same LAN:

```text
http://192.168.11.200:8065/openclaw/channels/triad-oni-cadia-main
```

The LAN entrypoint is a lightweight TCP forwarder:

```text
192.168.11.200:8065 -> 127.0.0.1:8065
```

The forwarder PID and logs live under:

```text
/home/maki/codex-workspace/ARCADIA/.openclaw/public-tunnels/
```

The forwarder is managed by this user service on `vm200`:

```text
oni-cadia-mattermost-lan.service
```

## Cloudflare quick tunnel

A Cloudflare quick tunnel can publish the same Mattermost origin:

```text
http://127.0.0.1:8065
```

The current quick tunnel URL is printed in:

```text
/home/maki/codex-workspace/ARCADIA/.openclaw/public-tunnels/mattermost-cloudflared.log
```

Quick tunnel URLs are temporary and may change after a tunnel restart. For a permanent public URL, replace this with a named Cloudflare Tunnel attached to an owned domain.

The quick tunnel is managed by this user service on `vm200`:

```text
oni-cadia-mattermost-cloudflare.service
```

## Verification

From a client on the LAN:

```sh
curl -Is http://192.168.11.200:8065/openclaw/channels/triad-oni-cadia-main
```

For the quick tunnel, read the URL from the log and verify the channel page:

```sh
url=$(ssh vm200 "grep -o 'https://[-a-z0-9]*\\.trycloudflare\\.com' /home/maki/codex-workspace/ARCADIA/.openclaw/public-tunnels/mattermost-cloudflared.log | tail -1")
curl -Is "$url/openclaw/channels/triad-oni-cadia-main"
```
