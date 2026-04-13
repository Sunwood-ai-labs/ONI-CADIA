# 自律チームガイド

このリポジトリは Podman ラッパーだけではなく、少人数の OpenClaw チームを個別エージェントとして扱える構成にしています。  
それぞれの状態を分離しつつ、ローカルの共通面で協調できます。

## 各エージェントの構成

`init --count N` を実行すると、各インスタンスが次を受け取ります。

- 個別の `openclaw.json`
- 個別の `pod.yaml`
- 個別の env / 制御ファイル
- 個別の `workspace/`
- pod 内の Mattermost 補助ツール

このため、1 つの巨大コンテナとしてではなく、複数のオペレーターを独立して運用する感覚になります。

現在のヘルパー実装は `scripts/mattermost_tools/` にあり、各 Pod には `/home/node/.openclaw/mattermost-tools/` としてコピーされます。

## チームらしさを作るファイル

生成済み workspace に含まれる主なファイル:

- `AGENTS.md`: workspace 運用ルール
- `SOUL.md`: ボイス・性格・協調姿勢
- `IDENTITY.md`: 役割名、署名、行動方針
- `USER.md`: 支援対象
- `HEARTBEAT.md`: heartbeat 時に実行する内容
- `TOOLS.md`: 機械依存情報とチートシート
- `BOOTSTRAP.md`: 初回起動時の手順

議論チーム、作成チーム、検証チームとして使う場合は、まず最初にこれらを調整します。

## 運用モード

### 人間主導の調整

人間が `oncall` モードで room を主導し、`@iori` のようにエージェントを直接メンションする場合に使います。

### Heartbeat 自律

```powershell
.\scripts\mattermost.ps1 lounge enable --count 3
```

有効化すると、各エージェントは毎 heartbeat ごとに Mattermost 状態を最初に確認し、ブロックされていなければ 1 件の補助アクションを実行します。  
レート制限時は `HEARTBEAT_OK` 扱いになります。

ヘルパーエントリポイント:

- `get_state.py`
- `post_message.py`
- `create_channel.py`
- `add_reaction.py`

共通ランタイムは `common_runtime.py` にまとまっています。  
旧 one-shot の lounge runner は削除され、現在の heartbeat-first フローに一致する構成になっています。

### 手動トリガー

```powershell
.\scripts\mattermost.ps1 lounge run-now --count 3 --wait-seconds 15
```

次の heartbeat を待たずに即時実行したいときに使います。

## 初期調整手順

1. `.env` をプロバイダーと Mattermost 設定向けに更新
2. `.\scripts\init.ps1 --count 3` を実行
3. 生成 workspace の persona スカフォールドを各自編集
4. Mattermost を起動して bot seed
5. Pod を起動し `smoke` を実行
6. チームのボイスが収束したら heartbeat 自律を有効化（または最終確認として有効化）

## 小規模チーム向け既定構成

既定の 3 体構成:

- `システム統括`: デプロイメントと state 管理
- `設計メモ係`: docs とプロンプト、アイデア整形
- `検証担当`: テストとリスクチェック

この形は初期に過剰な人数を持たず、役割分担と引き継ぎを作りやすい設計です。
