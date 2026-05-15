#!/bin/bash
#
# tagaru-study-hub セットアップスクリプト
# "タガル式・自分の教科書" を始めるための1コマンド
#
# 使い方:
#   curl -fsSL https://raw.githubusercontent.com/Tagaru05/tagaru-study-hub/main/install.sh | bash
#

set -e

REPO_URL="https://raw.githubusercontent.com/Tagaru05/tagaru-study-hub/main"
SKILL_DIR="$HOME/.claude/skills/study-hub"

echo ""
echo "🎓 タガル式・自分の教科書 セットアップ"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# 1. Python 確認
echo "▶ Step 1/5: Python の確認..."
if ! command -v python3 >/dev/null 2>&1; then
  echo "❌ Python 3 が見つかりません。"
  echo "   先に https://www.python.org からインストールしてください。"
  exit 1
fi
echo "✅ Python OK: $(python3 --version)"
echo ""

# 2. pip 確認
echo "▶ Step 2/5: pip の確認..."
if ! command -v pip >/dev/null 2>&1 && ! command -v pip3 >/dev/null 2>&1; then
  echo "❌ pip が見つかりません。"
  exit 1
fi
PIP_CMD="pip3"
if ! command -v pip3 >/dev/null 2>&1; then PIP_CMD="pip"; fi
echo "✅ pip OK: $PIP_CMD"
echo ""

# 3. notebooklm-py をインストール
echo "▶ Step 3/5: notebooklm-py をインストール中..."
$PIP_CMD install --upgrade notebooklm-py
echo "✅ notebooklm-py インストール完了"
echo ""

# 4. NotebookLM にログイン（ブラウザが開きます）
echo "▶ Step 4/5: NotebookLM ログイン"
echo "   ブラウザが自動で開きます。Googleアカウントで「許可」をクリックしてください..."
echo ""
notebooklm login
echo ""
echo "✅ ログイン完了"
echo ""

# 5. NotebookLMスキルをClaude Codeに登録
echo "▶ Step 5/5: Claude Codeスキルを設定中..."
notebooklm skill install

# study-hub スキルを配置
mkdir -p "$SKILL_DIR"
if curl -fsSL "${REPO_URL}/skills/study-hub/SKILL.md" -o "${SKILL_DIR}/SKILL.md"; then
  echo "✅ /study-hub スキル配置完了"
else
  echo "⚠️ スキルのダウンロードに失敗しました（リポジトリURLを確認してください）"
fi

# 言語を日本語に
notebooklm language set ja >/dev/null 2>&1 || true
echo "✅ 出力言語: 日本語"

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🎉 セットアップ完了！"
echo ""
echo "次は Claude Code を起動して、こう話しかけてみてください："
echo ""
echo "    /study-hub 学びたいテーマ"
echo ""
echo "例:"
echo "    /study-hub 感情"
echo "    /study-hub 自己肯定感"
echo "    /study-hub マーケティング"
echo ""
echo "あなた専用の学習ハブが、一晩で完成します。"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
