# Release QA Inventory: v0.1.0

## Release Context

- repository: `Sunwood-ai-labs/ONI-CADIA`
- release tag: `v0.1.0`
- compare range: initial release with no previous tag, root commit `c50d6bb` through the peeled `v0.1.0` tag target
- requested outputs: GitHub release body, docs-backed release notes, companion walkthrough article, release header SVG, QA inventory
- validation commands run: `git fetch --tags --prune`, `git diff --stat $(git rev-list --max-parents=0 HEAD)..HEAD`, `uv run python -m compileall src scripts/mattermost_tools`, `uv run python -m unittest discover -s tests`, `uv run openclaw-podman --help`, `npm --prefix docs ci`, `npm --prefix docs run docs:build`, SVG XML and internal reference check
- release URLs: `https://github.com/Sunwood-ai-labs/ONI-CADIA/releases/tag/v0.1.0`, `https://sunwood-ai-labs.github.io/ONI-CADIA/guide/releases/v0.1.0`, `https://sunwood-ai-labs.github.io/ONI-CADIA/guide/articles/v0.1.0-launch`
- published at: `2026-05-05T17:04:48Z`, equivalent to `2026-05-06T02:04:48+09:00`

## Claim Matrix

| claim | code refs | validation refs | docs surfaces touched | scope |
| --- | --- | --- | --- | --- |
| The release is the first tagged ONI-CADIA release and covers the full initial shipped history | `git tag --list`, `git ls-remote --tags origin v0.1.0`, `git diff --stat $(git rev-list --max-parents=0 HEAD)..HEAD` | `gh release view v0.1.0 --json url,name,tagName,isDraft,isPrerelease,publishedAt,targetCommitish,body` | docs/guide/releases/v0.1.0.md, docs/ja/guide/releases/v0.1.0.md | release_scope |
| Operators can run lifecycle commands through the Python CLI and PowerShell wrappers | `src/openclaw_podman_starter/cli.py`, `scripts/*.ps1`, `.github/workflows/ci.yml` | `uv run openclaw-podman --help`, GitHub CI run `25390523782` | README.md, README.ja.md, docs/guide/releases/v0.1.0.md, docs/ja/guide/releases/v0.1.0.md | steady_state |
| Managed per-agent workspace and heartbeat-first Mattermost scaffolds are part of the shipped starter | `src/openclaw_podman_starter/cli.py`, `scripts/mattermost_tools/*.py`, `.openclaw/instances/agent_*/workspace/*.md`, `tests/test_cli.py` | `uv run python -m unittest discover -s tests`, GitHub CI run `25390523782` | README.md, README.ja.md, docs/guide/agent-teams.md, docs/ja/guide/agent-teams.md, docs/guide/articles/v0.1.0-launch.md, docs/ja/guide/articles/v0.1.0-launch.md | steady_state |
| Provider-mixed teams can be configured with provider-qualified model refs and per-instance overrides | `.env.example`, `src/openclaw_podman_starter/cli.py`, `tests/test_cli.py` | `uv run python -m unittest discover -s tests`, `test_ensure_openclaw_config_supports_nvidia_model_ref`, `test_mattermost_persona_usernames_use_romanized_handles` | README.md, README.ja.md, docs/guide/configuration.md, docs/ja/guide/configuration.md, docs/guide/releases/v0.1.0.md, docs/ja/guide/releases/v0.1.0.md | steady_state |
| Bilingual release docs, companion articles, and release header SVG are published through GitHub Pages | `docs/.vitepress/config.ts`, `docs/guide/releases/v0.1.0.md`, `docs/ja/guide/releases/v0.1.0.md`, `docs/guide/articles/v0.1.0-launch.md`, `docs/ja/guide/articles/v0.1.0-launch.md`, `docs/public/release-header-v0.1.0.svg`, `.github/workflows/pages.yml` | `npm --prefix docs run docs:build`, Pages run `25390523748`, live `curl` checks returned 200 | docs/guide/releases.md, docs/ja/guide/releases.md, docs/guide/articles.md, docs/ja/guide/articles.md, docs/guide/releases/v0.1.0.md, docs/ja/guide/releases/v0.1.0.md, docs/guide/articles/v0.1.0-launch.md, docs/ja/guide/articles/v0.1.0-launch.md | release_collateral |

## Steady-State Docs Review

| surface | status | evidence |
| --- | --- | --- |
| README.md | pass | Reviewed primary English operator surface and added provider-mixed team guidance for seats 4-9 |
| README.ja.md | pass | Synced Japanese triad role names to the actual personas and added provider-mixed team guidance |
| docs/guide/configuration.md | pass | Added `OPENCLAW_MODEL_REF`, fallback, provider endpoint, provider key, and per-instance override guidance |
| docs/ja/guide/configuration.md | pass | Added the matching Japanese model ref, provider endpoint, provider key, and per-instance override guidance |
| docs/guide/releases/v0.1.0.md | pass | Corrected the six-seat wording to scope optional NVIDIA seats 7-9 and updated validation commands |
| docs/ja/guide/releases/v0.1.0.md | pass | Corrected the Japanese six-seat wording to scope optional NVIDIA seats 7-9 and updated validation commands |
| docs/guide/articles/v0.1.0-launch.md | pass | Added the tracked starter state claim for triad, expanded seats, and optional NVIDIA seats |
| docs/ja/guide/articles/v0.1.0-launch.md | pass | Added the matching Japanese tracked starter state claim |
| docs/guide/quickstart.md | pass | Reviewed, no change needed because the default operator path remains `--count 3` |
| docs/ja/guide/quickstart.md | pass | Reviewed, no change needed because the default Japanese operator path remains `--count 3` |
| docs/guide/agent-teams.md | pass | Reviewed, no change needed because it already describes heartbeat-first helper behavior and workspace scaffolds |
| docs/ja/guide/agent-teams.md | pass | Reviewed, no change needed because it already describes heartbeat-first helper behavior and workspace scaffolds |
| docs/guide/releases.md | pass | Reviewed release index, existing v0.1.0 link remains current |
| docs/ja/guide/releases.md | pass | Reviewed Japanese release index, existing v0.1.0 link remains current |
| docs/guide/articles.md | pass | Reviewed article index, existing launch article link remains current |
| docs/ja/guide/articles.md | pass | Reviewed Japanese article index, existing launch article link remains current |

## QA Inventory

| criterion_id | status | evidence |
| --- | --- | --- |
| compare_range | pass | No previous tag existed before release. Initial release range was resolved from root commit `c50d6bb` through the peeled `v0.1.0` tag target |
| release_claims_backed | pass | Inspected `src/openclaw_podman_starter/cli.py`, `tests/test_cli.py`, `.env.example`, `.github/workflows/*.yml`, `docs/`, `assets/`, and `reports/` |
| docs_release_notes | pass | docs/guide/releases/v0.1.0.md, docs/ja/guide/releases/v0.1.0.md |
| companion_walkthrough | pass | docs/guide/articles/v0.1.0-launch.md, docs/ja/guide/articles/v0.1.0-launch.md |
| operator_claims_extracted | pass | Claim Matrix completed above with CLI, Mattermost, provider, docs, Pages, and release scope claims |
| impl_sensitive_claims_verified | pass | CLI, provider, Mattermost, and model override claims verified against code and `uv run python -m unittest discover -s tests` |
| steady_state_docs_reviewed | pass | README, configuration docs, quickstart docs, agent-team docs, release indexes, release notes, and articles reviewed in the table above |
| claim_scope_precise | pass | Wording distinguishes default triad, six-seat public-square copy, optional NVIDIA seats 7-9, and experimental Rokuseki bundles |
| latest_release_links_updated | pass | Release and article indexes already point to v0.1.0 and were reviewed as current |
| svg_assets_validated | pass | Python SVG check verified XML parse, scalable dimensions, and internal refs for `assets/header.svg`, `assets/release-header-v0.1.0.svg`, `docs/public/release-header-v0.1.0.svg` |
| docs_assets_committed_before_tag | pass | Release docs, article pages, and header asset were committed in `b3fd0a8` and pushed before creating `v0.1.0` |
| docs_deployed_live | pass | GitHub Pages run `25390523748` succeeded and live docs/article/header URLs returned HTTP 200 |
| tag_local_remote | pass | Local annotated tag `v0.1.0` exists and `git ls-remote --tags origin v0.1.0*` shows both the tag object and peeled commit |
| github_release_verified | pass | `gh release view v0.1.0 --json url,name,tagName,isDraft,isPrerelease,publishedAt,targetCommitish,body` verified a non-draft release at `https://github.com/Sunwood-ai-labs/ONI-CADIA/releases/tag/v0.1.0` |
| validation_commands_recorded | pass | Validation commands are recorded in this Release Context and in the docs-backed release notes |
| publish_date_verified | pass | GitHub release `publishedAt` is `2026-05-05T17:04:48Z`, equivalent to `2026-05-06T02:04:48+09:00` |

## Notes

- blockers: none
- waivers: host shell does not provide `pwsh` or `powershell`, so SVG checks were run with an equivalent Python XML/reference validator on this Mac
- follow-up docs tasks: none for v0.1.0
