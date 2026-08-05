#!/bin/bash
# ============================================================
# 本地一键同步：把两个源仓库的 index.html 复制进来并推送到 GitHub
# 用法：在 daletou_zong 目录下执行  ./sync.sh
# ============================================================
set -e

# 定位到脚本所在目录（兼容路径含空格/中文）
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

FENXI_SRC="${HOME}/同步空间/ClaudeCodeProjects/daletou_fenxi/index.html"
YUCE_SRC="${HOME}/同步空间/ClaudeCodeProjects/daletou_yuce/index.html"

if [ ! -f "$FENXI_SRC" ]; then
  echo "❌ 找不到源文件: $FENXI_SRC"
  exit 1
fi
if [ ! -f "$YUCE_SRC" ]; then
  echo "❌ 找不到源文件: $YUCE_SRC"
  exit 1
fi

cp "$FENXI_SRC" fenxi/index.html
cp "$YUCE_SRC" yuce/index.html

git add fenxi/index.html yuce/index.html
if git diff --cached --quiet; then
  echo "✅ 无变化，无需提交"
else
  git commit -m "sync: 本地同步源仓库 index.html $(date '+%Y-%m-%d %H:%M')"
  echo "📤 推送中…"
  git push
  echo "✅ 已同步并推送到 GitHub"
fi
