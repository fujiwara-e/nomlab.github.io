#!/bin/sh
set -eu

cd "$(git rev-parse --show-toplevel)"
if git config --get core.hooksPath >/dev/null; then
    echo 'error: core.hooksPath is configured. Integrate samples/pre-commit into your existing hooks manually.' >&2
    exit 1
fi

hooks_dir=.git/hooks
target="$hooks_dir/pre-commit"
if [ -e "$target" ] || [ -L "$target" ]; then
    if [ ! -L "$target" ] && [ -f "$target" ] && cmp -s samples/pre-commit "$target"; then
        chmod +x "$target"
        echo 'pre-commit hook is already installed.'
        exit 0
    fi
    echo "error: $target already exists with different contents. Merge samples/pre-commit into it manually." >&2
    exit 1
fi

mkdir -p "$hooks_dir"
install -m 755 samples/pre-commit "$target"
echo "Installed $target"
