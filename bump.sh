#!/bin/bash
# Usage: ./bump.sh [patch|minor|major]
# patch = bug fix / small style tweak       (x.x.+1)
# minor = new feature / significant change  (x.+1.0)
# major = major overhaul / redesign         (+1.0.0)

LEVEL=${1:-patch}
TOOL="tool.html"

CURRENT=$(grep -o 'Ver\. [0-9]*\.[0-9]*\.[0-9]*' "$TOOL" | head -1 | grep -o '[0-9]*\.[0-9]*\.[0-9]*')
if [ -z "$CURRENT" ]; then
  echo "❌ 找不到版本號"; exit 1
fi

IFS='.' read -r MAJOR MINOR PATCH <<< "$CURRENT"
case $LEVEL in
  major) MAJOR=$((MAJOR+1)); MINOR=0; PATCH=0 ;;
  minor) MINOR=$((MINOR+1)); PATCH=0 ;;
  patch) PATCH=$((PATCH+1)) ;;
  *) echo "❌ 用法：./bump.sh [patch|minor|major]"; exit 1 ;;
esac

NEW="$MAJOR.$MINOR.$PATCH"
sed -i '' "s/Ver\. $CURRENT/Ver. $NEW/" "$TOOL"
echo "✅ 版本更新：$CURRENT → $NEW"
