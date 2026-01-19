#!/usr/bin/env bash
set -e

ZSHRC="$HOME/.zshrc"

echo "▶ Installing fzf (Arch)…"
sudo pacman -S --needed fzf

echo "▶ Updating ~/.zshrc…"

# Remove unsupported Ctrl-R command if present
sed -i '/FZF_CTRL_R_COMMAND/d' "$ZSHRC"

# Append config only if not already present
if ! grep -q "==== fzf key bindings (Arch Linux) ====" "$ZSHRC"; then
cat <<'EOF' >> "$ZSHRC"

# ==== fzf key bindings (Arch Linux) ====

# Remove unsupported custom Ctrl-R command (prevents warning)
unset FZF_CTRL_R_COMMAND

# fzf defaults
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"
export FZF_CTRL_R_OPTS="--tac --preview 'echo {}' --preview-window down:3:hidden:wrap"

# Source fzf (Arch path)
if [[ -f /usr/share/fzf/key-bindings.zsh ]]; then
  source /usr/share/fzf/key-bindings.zsh
fi

if [[ -f /usr/share/fzf/completion.zsh ]]; then
  source /usr/share/fzf/completion.zsh
fi

# Ensure Ctrl+R works in vi insert mode
bindkey -M viins '^R' fzf-history-widget

# ==== end fzf ====
EOF
fi

echo "✅ Done."
echo "➡ Open a NEW terminal or run: exec zsh"

