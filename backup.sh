#!/bin/bash
# Evolver 进化资产自动备份脚本
# 用法: bash backup.sh

cd "$(dirname "$0")" || exit 1

# 添加所有进化资产
git add memory/ assets/gep/ .gitignore 2>/dev/null

# 如果没有变化则退出
git diff --cached --quiet && exit 0

# 提交并推送
git commit -m "evolution: $(date '+%Y-%m-%d %H:%M')"
git push origin master

echo "[backup] Evolution assets pushed to GitHub at $(date '+%Y-%m-%d %H:%M')"
