#! /usr/bin/env bash
set -eux
set -o pipefail

# 輸出當前使用者名稱
echo "User: $USER"
# 獲取並輸出當前工作目錄路徑
current_dir=$(pwd)
echo "Current directory: $current_dir"

# ==================================================================================================
# Java 格式化工具
# npm install -g google-java-format

# 格式化所有 Java 文件
# google-java-format -i --glob=src/**/*.java

# 在 CI 可以這樣檢查
# google-java-format --set-exit-if-changed -n --glob=src/**/*.java

# Ref: https://blog.miniasp.com/post/2022/09/05/Using-google-java-format-on-VSCode-and-IntelliJ-IDEA

# ==================================================================================================
npm install --save-dev prettier prettier-plugin-java

cat > ./.prettierrc.yaml << EOF
plugins:
  - prettier-plugin-java
EOF

# ==================================================================================================
# Commit message 格式檢查
npm install @commitlint/config-conventional @commitlint/cli --save-dev 

# 建立 commitlint 配置文件
echo "module.exports = {extends: ['@commitlint/config-conventional']}" > commitlint.config.js

# 測試 commitlint 是否正常工作
# echo 'foo: bar' | commitlint

# ==================================================================================================
# 開發環境建立自動機制
npm install husky lint-staged --save-dev

# 檢查當前目錄是否為 Git 倉庫，如果不是則進行初始化
if [ ! -d ".git" ]; then
    git init
fi

# 配置 Git 以避免擁有權檢查問題
git config --global --add safe.directory "$current_dir"

# 初始化 Husky
npx husky init

cat > .lintstagedrc.json << EOF
{
  "*.+(java)": ["prettier --write"],
  "*.+(json)": ["prettier --write"],
  "*.+(yaml|yml)": ["prettier --write"]
}
EOF


# 建立 pre-commit hook
cat > .husky/pre-commit << EOF
echo "Running husky pre-commit"

npx lint-staged

echo "Husky pre-commit success"
EOF

# 建立 commit-msg hook
cat > .husky/commit-msg << EOF
npx --no-install commitlint --edit
EOF
