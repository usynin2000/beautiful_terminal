#!/bin/bash

# -------------------------------
# Beautiful Terminal Setup Script
# Idempotent version
# -------------------------------

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# -------------------------------
# Homebrew
# -------------------------------
if command_exists brew; then
    echo "Homebrew already installed ✅"
else
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# -------------------------------
# iTerm2
# -------------------------------
if brew list --cask iterm2 &>/dev/null; then
    echo "iTerm2 already installed ✅"
else
    echo "Installing iTerm2..."
    brew install --cask iterm2
fi

# -------------------------------
# Zsh as default shell
# -------------------------------
CURRENT_SHELL=$(dscl . -read ~/ UserShell | awk '{print $2}')
if [[ "$CURRENT_SHELL" != "/bin/zsh" ]]; then
    echo "Setting Zsh as default shell..."
    chsh -s /bin/zsh
else
    echo "Zsh is already default shell ✅"
fi

# -------------------------------
# Oh My Zsh
# -------------------------------
if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh My Zsh already installed ✅"
else
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# -------------------------------
# Theme
# -------------------------------
ZSHRC_FILE="$HOME/.zshrc"
THEME="fletcherm"
CURRENT_THEME=$(grep "^ZSH_THEME=" "$ZSHRC_FILE" | cut -d'"' -f2)

if [[ "$CURRENT_THEME" != "$THEME" ]]; then
    echo "Setting theme to $THEME..."
    sed -i '' "s/^ZSH_THEME=.*/ZSH_THEME=\"$THEME\"/" "$ZSHRC_FILE"
else
    echo "Theme already set to $THEME ✅"
fi

# -------------------------------
# Plugins
# -------------------------------
PLUGINS_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins"

# zsh-autosuggestions
if [ -d "$PLUGINS_DIR/zsh-autosuggestions" ]; then
    echo "Plugin zsh-autosuggestions already installed ✅"
else
    echo "Installing zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions "$PLUGINS_DIR/zsh-autosuggestions"
fi

# zsh-syntax-highlighting
if [ -d "$PLUGINS_DIR/zsh-syntax-highlighting" ]; then
    echo "Plugin zsh-syntax-highlighting already installed ✅"
else
    echo "Installing zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$PLUGINS_DIR/zsh-syntax-highlighting"
fi

# Ensure plugins are in .zshrc
grep -q "plugins=(.*git.*zsh-autosuggestions.*zsh-syntax-highlighting.*z)" "$ZSHRC_FILE" || \
    sed -i '' 's/^plugins=.*/plugins=(git zsh-autosuggestions zsh-syntax-highlighting z)/' "$ZSHRC_FILE"

# -------------------------------
# Reload .zshrc
# -------------------------------
echo "Reloading .zshrc..."
source "$HOME/.zshrc"

# -------------------------------
# Nerd Font
# -------------------------------
if brew list --cask font-meslo-lg-nerd-font &>/dev/null; then
    echo "Nerd Font already installed ✅"
else
    echo "Installing MesloLGS NF Nerd Font..."
    brew tap homebrew/cask-fonts
    brew install --cask font-meslo-lg-nerd-font
fi

echo "Setup complete! 🎉"
