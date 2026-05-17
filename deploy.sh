#!/bin/bash
# Commits and pushes. Use this instead of raw git commands.
set -e
cd "$(dirname "$0")"

if [ -z "$1" ]; then
    read -p "Commit message: " MSG
else
    MSG="$*"
fi

[ -z "$MSG" ] && echo "Commit message required" && exit 1

git add -A
git commit -m "$MSG"
git push

echo ""
echo "✅ Deployed $(basename "$(pwd)")"

