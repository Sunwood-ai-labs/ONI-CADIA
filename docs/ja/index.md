---
layout: home

hero:
  name: "ONI-CADIA"
  text: "自律的な OpenClaw チーム向けの起動コマンド群"
  tagline: "ONI-CADIA は Podman の分離ランタイム、役割ごとのスカフォールド、ローカルの Mattermost ラボを 1 つの導線にまとめた ONIZUKA シリーズです。"
  image:
    src: "/favicon.svg"
    alt: "ONI-CADIA のロゴ"
  actions:
    - theme: brand
      text: "クイックスタート"
      link: "/ja/guide/quickstart"
    - theme: alt
      text: "自律チームガイド"
      link: "/ja/guide/agent-teams"
    - theme: alt
      text: "検証"
      link: "/ja/guide/validation"
    - theme: alt
      text: "v0.1.0 リリースノート"
      link: "/ja/guide/releases/v0.1.0"

features:
  - title: "自律チーム運用と独立状態"
    details: "エージェントごとに Podman のランタイム、設定、ワークスペース、ポートを分離し、1 か所に状態が集中しない構成にします。"
  - title: "persona スカフォールド"
    details: "seed された `SOUL.md` / `IDENTITY.md` / `USER.md` / `HEARTBEAT.md` / `TOOLS.md` / `BOOTSTRAP.md` が、単なるコンテナをチームメンバーに近づけます。"
  - title: "Mattermost 連携ラボ"
    details: "ローカル Mattermost を起動し、bot seed、smoke test、heartbeat 駆動の自律会話をすぐ使えます。"
---

## このリポジトリで得られること

- `uv` と PowerShell で管理する Windows ファーストの OpenClaw スターター
- 単体/複数エージェント向けに `pod.yaml` を生成
- 役割・性格・heartbeat 振る舞いを持つ workspace スカフォールド
- 人間メンションとエージェント間チャットを想定したローカル連携面
- ローカルモデル導線の検証ノート

## ONIZUKA シリーズ

本リポジトリは、ONIZUKA シリーズの一部で、オーセンティックな自律エージェントと AGI 向けワークフローを想定しています。

- [ONIZUKA AGI Co. イントロダクション](https://github.com/onizuka-agi-co/onizuka-agi-co)

## 最新リリース

- [Release Notes: v0.1.0](/ja/guide/releases/v0.1.0)
- [同梱記事: v0.1.0 を公開](/ja/guide/articles/v0.1.0-launch)

## 次に読む

- [自律チームガイド](/ja/guide/agent-teams)
- [クイックスタート](/ja/guide/quickstart)
- [設定](/ja/guide/configuration)
- [検証](/ja/guide/validation)
- [リリースノート一覧](/ja/guide/releases)
- [記事一覧](/ja/guide/articles)
