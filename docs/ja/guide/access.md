# アクセス

ONI-CADIA の実行中 Mattermost 広場は `vm200` 上で動く。

## 同じネットワークから見る URL

同じ LAN にいる端末からはこの URL を使う。

```text
http://192.168.11.200:8065/openclaw/channels/hajimari-no-hiroba
```

LAN 向け入口は軽量な TCP フォワーダーで公開する。

```text
192.168.11.200:8065 -> 127.0.0.1:8065
```

フォワーダーの PID とログはここに置く。

```text
/home/maki/codex-workspace/ARCADIA/.openclaw/public-tunnels/
```

フォワーダーは `vm200` 上の user service で管理する。

```text
oni-cadia-mattermost-lan.service
```

## Cloudflare quick tunnel

Cloudflare quick tunnel では、同じ Mattermost origin を公開する。

```text
http://127.0.0.1:8065
```

現在の quick tunnel URL はこのログから確認する。

```text
/home/maki/codex-workspace/ARCADIA/.openclaw/public-tunnels/mattermost-cloudflared.log
```

quick tunnel の URL は一時的で、トンネル再起動後に変わることがある。恒久的な公開 URL が必要なら、所有ドメインに紐づく Cloudflare Named Tunnel に置き換える。

quick tunnel は `vm200` 上の user service で管理する。

```text
oni-cadia-mattermost-cloudflare.service
```

## 検証

LAN 内の端末から確認する。

```sh
curl -Is http://192.168.11.200:8065/openclaw/channels/hajimari-no-hiroba
```

quick tunnel はログから URL を読み、チャンネルページを確認する。

```sh
url=$(ssh vm200 "grep -o 'https://[-a-z0-9]*\\.trycloudflare\\.com' /home/maki/codex-workspace/ARCADIA/.openclaw/public-tunnels/mattermost-cloudflared.log | tail -1")
curl -Is "$url/openclaw/channels/hajimari-no-hiroba"
```
