# アーキテクチャ ― このリポジトリと周辺ツールの関係

このリポジトリ（`tagaru-study-hub`）は **「タガル式・自分の教科書」スキルの配布パッケージ** です。
実際にスキルを動かすには、複数のフォルダ・ツールが連携します。本書はその全体像をまとめます。

---

## 全体像

```
┌─────────────────────────────────────────────────────────────────┐
│  GitHub: Tagaru05/tagaru-study-hub  （このリポジトリ／配布元）  │
│   ├─ skills/study-hub/SKILL.md   ← スキル本体                   │
│   ├─ install.sh                  ← 1コマンドセットアップ        │
│   ├─ README.md / docs/           ← 使い方ドキュメント            │
│   └─ examples/                   ← サンプル目次                  │
└─────────────────────────────────────────────────────────────────┘
                              │
                              │ install.sh が curl で取得
                              ▼
┌─────────────────────────────────────────────────────────────────┐
│  ローカル環境 ~/.claude/skills/         （インストール先）       │
│   ├─ study-hub/SKILL.md      ← このリポジトリのコピー            │
│   ├─ notebooklm/SKILL.md     ← 別スキル（notebooklm-py 由来）    │
│   └─ nohau-library/SKILL.md  ← 別スキル（ノウハウ図書館記事制作）│
└─────────────────────────────────────────────────────────────────┘
                              │
                              │ スキルが内部で呼ぶ
                              ▼
┌─────────────────────────────────────────────────────────────────┐
│  notebooklm CLI （pip install notebooklm-py）                    │
│   - NotebookLM をコマンドラインから操作                          │
│   - ブラウザログイン状態を ~/.notebooklm に保持                  │
└─────────────────────────────────────────────────────────────────┘
                              │
                              │ 成果物の置き場
                              ▼
┌─────────────────────────────────────────────────────────────────┐
│  ~/Notebook LM操作用/  （日々のリサーチ作業用ワークスペース）    │
│   ├─ 01_sources/   ← NotebookLM 投入前の素材                     │
│   ├─ 02_outputs/   ← NotebookLM から取り出した結果               │
│   ├─ 03_drafts/    ← 記事下書き                                  │
│   └─ archive/      ← 完了案件の退避                              │
└─────────────────────────────────────────────────────────────────┘
```

---

## 各構成要素の役割

### 1. このリポジトリ（配布元）

**場所:** https://github.com/Tagaru05/tagaru-study-hub
**ローカルクローン:** `~/Desktop/総合フォルダー/コード・ツール/ノウハウ図書館Code/tagaru-study-hub/`

| ファイル | 役割 |
|---|---|
| `skills/study-hub/SKILL.md` | スキル本体。Claude Code に読み込ませる定義 |
| `install.sh` | Python・pip・notebooklm-py・スキル配置を1コマンドで実行 |
| `README.md` | プロジェクト紹介と5分セットアップ手順 |
| `docs/` | 使い方ガイド、FAQ、仕組み解説 |
| `examples/` | 完成した教科書のサンプル目次 |

このリポジトリは **「配布される側」**。ここを編集してコミット → 利用者が `install.sh` で取得する流れ。

### 2. インストール先（`~/.claude/skills/`）

Claude Code が起動時に読み込むスキル置き場。**3つの独立したスキル**が同居しています：

| スキル | 由来 | 役割 |
|---|---|---|
| `study-hub/` | **このリポジトリ** | テーマ → リサーチ → 9章構成の教科書 → NotebookLM |
| `notebooklm/` | [notebooklm-py](https://pypi.org/project/notebooklm-py/) | NotebookLM の CLI ラッパー（低レベルAPI） |
| `nohau-library/` | 別管理 | ノウハウ図書館記事制作 |

**重要:** `study-hub` は `notebooklm` を **内部で呼び出す**（NotebookLM へのソース追加・音声生成等）。
`notebooklm` 単体でも使えるが、教科書として組み立てるのは `study-hub` の役割。

### 3. notebooklm CLI

`pip install notebooklm-py` で入る Python パッケージ。Google アカウントでブラウザログイン後、コマンドラインから NotebookLM を操作する。

- 認証情報: `~/.notebooklm/`（`storage_state.json`, `browser_profile/`）
- 主なコマンド: `notebooklm list / use / ask / source list` 等

スキルは内部でこの CLI を `Bash` ツール経由で呼んでいる。

### 4. `~/Notebook LM操作用/` ワークスペース

**日々の作業フォルダ**。リポジトリでもスキルでもなく、**素材と成果物の置き場**。

| サブフォルダ | 中身 |
|---|---|
| `01_sources/` | NotebookLM に投入する PDF・テキスト・URL リスト |
| `02_outputs/` | NotebookLM から取り出した要約・Q&A・スライド・マインドマップ |
| `03_drafts/` | ノウハウ図書館・note・X 告知の下書き |
| `archive/` | 完了した案件の退避先 |

1案件 = 各フォルダ配下に **同名サブフォルダ**（例: `2026-04-18_クロードコード入門/`）を作る運用。
Git 管理なし（個人のリサーチ素材を含むため）。

---

## 編集する場所の早見表

| やりたいこと | 編集する場所 |
|---|---|
| `/study-hub` スキルのプロンプトを変える | このリポジトリの `skills/study-hub/SKILL.md` → commit → push |
| インストール手順を変える | このリポジトリの `install.sh` → commit → push |
| 自分の環境のスキルだけ一時的に試す | `~/.claude/skills/study-hub/SKILL.md` を直接編集（リポジトリには反映されない） |
| `notebooklm` CLI 自体を更新 | `pip install --upgrade notebooklm-py` |
| 日々のリサーチ素材を置く | `~/Notebook LM操作用/01_sources/` |

---

## デプロイの流れ（このリポジトリを更新するとき）

1. ローカルで `skills/study-hub/SKILL.md` などを編集
2. `git add . && git commit -m "..." && git push`
3. 利用者は次回 `install.sh` を再実行するか、`curl -fsSL https://raw.githubusercontent.com/Tagaru05/tagaru-study-hub/main/skills/study-hub/SKILL.md -o ~/.claude/skills/study-hub/SKILL.md` で個別更新

> ⚠️ **Public/Private に注意:** `install.sh` は `curl https://raw.githubusercontent.com/...` で取得する設計。
> リポジトリが Private のあいだは外部からの自動インストールは動かない。自分の環境では問題なし。
> 配布する段階で Public 化すること。

---

## 関連リンク

- スキル詳細: [skills/study-hub/SKILL.md](../skills/study-hub/SKILL.md)
- セットアップ手順: [README.md](../README.md)
- 初心者向け: [docs/はじめて使う人のガイド.md](はじめて使う人のガイド.md)
- 仕組みの内部解説: [docs/仕組み解説.md](仕組み解説.md)
- よくある質問: [docs/FAQ.md](FAQ.md)
- notebooklm-py 公式: https://pypi.org/project/notebooklm-py/
