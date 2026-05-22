# 🎓 tagaru-study-hub

**学びたいテーマを、AIと一緒に "自分専用の教科書" に組み立てる**
**Claude Code × NotebookLM の連携スキル「タガル式・自分の教科書」**

> 目的は教科書を作ることじゃない。
> 学ぶ過程で、自分が言葉を持つこと。

---

## ✨ これは何？

「○○の教科書を作って」と日本語で話しかけるだけで、AIが：

1. テーマを **観点3〜5本** に分解する
2. **並列に4人のAI** がリサーチする
3. **9章構成の教科書** を組み立てる
4. **NotebookLMにアップロード** する
5. **マインドマップ・音声・FAQ** を自動生成する

…までを一晩で完了させる、Claude Code 用のスキルです。

完成すると、**いつでもブラウザ／スマホで勉強できる学習ハブ**が手に入ります。

---

## 🚀 3分でセットアップ

> 📌 **前提：** [Claude Code Desktop アプリ](https://claude.com) が既に入っていること。<br>
> ターミナル（黒い画面）は**開きません**。全部 Claude Code Desktop のチャット欄に貼るだけ。

### Step 1: Claude Code Desktop を起動して、フォルダを開く
適当なフォルダ（**デスクトップ**でOK）を「Open Folder」で開く。

### Step 2: チャット欄に下を貼って送信

```
次のコマンドを実行してください。タガル式・自分の教科書スキルをインストールします。

curl -fsSL https://raw.githubusercontent.com/Tagaru05/tagaru-study-hub/main/install.sh | bash

もしPythonやpipが無いと出たら、それも自動でインストールして続きを進めてください。
```

Claude Code が「実行していい?」と確認してくるので **Yes / Allow** をクリック。

### Step 3: Googleログイン
途中でブラウザが自動で開きます。普段のGoogleアカウントで「許可」をクリック。

### Step 4: Claude Code に話しかける
```
/study-hub 学びたいテーマ
```

例：
- `/study-hub 感情`
- `/study-hub 自己肯定感`
- `/study-hub マーケティング`

**これだけで、あなた専用の学習ハブが完成します。**

> 🆘 **うまくいかなかったら？** Claude Code のチャットに「**うまくいきません。直してください**」と書くだけ。
> Python が無い・pip が無い・権限エラー…どんなエラーでも Claude が自動で診断・解決します。
> 詳しくは **[🛠 統合HTMLサイトのトラブル対応セクション](https://tagaru05.github.io/tagaru-study-hub/#troubleshoot)**

> 💡 **じっくり読みたい方へ**：1ステップずつ画面表示と一緒に解説した
> **[👶 はじめて使う人のガイド](docs/はじめて使う人のガイド.md)** があります。15分で迷わず動けます。

---

## 🗺️ 仕組み（5人の連携プレー）

```
①あなた  →  ②Claude Code  →  ③Macの中の書類  →  ④リモコン  →  ⑤NotebookLM
（指示）    （AI操縦士）    （Markdown）       （notebooklm-py） （Googleのサービス）
```

| 登場人物 | 正体 | 役割 |
|---|---|---|
| ①あなた | 監督 | テーマを決めるだけ |
| ②**Claude Code** | 手足のあるAI | ファイルを作る・コマンドを撃つ |
| ③ローカルファイル | Markdown書類 | リサーチ素材・教科書本体 |
| ④**notebooklm-py** | NotebookLMのリモコン | ターミナルからNotebookLMを操作 |
| ⑤Google NotebookLM | クラウドの学習サービス | あなた専用の学習ハブになる |

詳細：[docs/仕組み解説.md](docs/仕組み解説.md)

---

## 📦 何が入っているか

```
tagaru-study-hub/
├── README.md           ← いまここ
├── install.sh          ← ワンライナーインストーラー
├── skills/
│   └── study-hub/
│       └── SKILL.md    ← Claude Codeスキル本体
├── examples/           ← 教科書の章立てサンプル
└── docs/
    ├── 仕組み解説.md    ← 初心者向け図解
    └── FAQ.md          ← よくある質問
```

---

## 🎯 こんな人に向いている

- 本気で学びたいテーマがある人
- 自分の言葉で語れるようになりたい人
- AIに「使われる」のではなく「使う」側に立ちたい人
- 発信・出版・講座を目指している人

逆に向いていない：
- 「効率よく知識を頭に入れたい」だけの人
- メソッドを暗記したいだけの人

このメソッドの目的は **学びの過程で自分と向き合う時間** を含むので。

---

## 📖 実例：感情の教科書

このメソッドで最初に作られた教科書が「感情とは何か」を扱ったもの。
1晩で：

- 約 60,000字 のリサーチ素材（6ファイル）
- 9章構成 の教科書（11ファイル）
- NotebookLMにマインドマップ・音声・FAQ・タイムライン・ブリーフィングドキュメントを自動生成

ができました。

実際の章立てサンプル：[examples/感情の教科書_目次サンプル.md](examples/感情の教科書_目次サンプル.md)

---

## ❓ よくある質問

→ [docs/FAQ.md](docs/FAQ.md)

---

## 👥 友達に紹介したいとき

「この学習ハブいいよ」と他の人に教えたくなったら、コピペで使えるテンプレ集があります。

→ [docs/友達に紹介するときのガイド.md](docs/友達に紹介するときのガイド.md)

LINE / メール / note それぞれ用の文面と、ITが苦手な相手への声かけのコツまでまとめてあります。

---

## 🛠 開発者向け

### 依存
- [Claude Code](https://claude.com) （Anthropic公式）
- [notebooklm-py](https://github.com/teng-lin/notebooklm-py) （teng-lin氏作）
- Python 3.10+
- macOS / Windows / Linux

### 手動セットアップ（自動インストーラーを使わない場合）
```bash
# notebooklm-py をインストール
pip install notebooklm-py

# NotebookLMにログイン
notebooklm login

# NotebookLMのClaude Codeスキルをインストール
notebooklm skill install

# study-hub スキルを配置
mkdir -p ~/.claude/skills/study-hub
curl -fsSL https://raw.githubusercontent.com/Tagaru05/tagaru-study-hub/main/skills/study-hub/SKILL.md \
  -o ~/.claude/skills/study-hub/SKILL.md

# 言語を日本語に
notebooklm language set ja
```

---

## 📝 作者

**タガル（@tagaru）**
言語化コーチ・AI講師
ミッション：誰もが自分の言葉で自分の価値を語れる世界をつくる

このメソッドは2026年5月、感情リサーチ作業中に偶然発見されました。
詳しい誕生秘話は、ノウハウ図書館の記事をご覧ください。

---

## 📄 ライセンス

MIT License — [LICENSE](LICENSE)

自由に使って、改造して、共有してください。
ただし「タガル式」を名乗る場合は、このリポジトリへのリンクを添えてくれると嬉しいです。

---

## 💡 哲学

> **「メソッドを売る」のではなく「道具を渡す」。**
> 教科書を作ることが目的じゃない。
> 学ぶ過程で、自分が言葉を持つことが目的。

このリポジトリは、その道具を世界中の人に渡すための場所です。

スター ⭐ を付けてもらえると、開発の励みになります。
