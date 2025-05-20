#!/bin/zsh

cd ~

# Install Homebrew if needed
if ! command -v brew >/dev/null 2>&1; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv || /usr/local/bin/brew shellenv)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
else
    echo "Homebrew already installed."
fi

# Ensure Homebrew is initialized
eval "$(/opt/homebrew/bin/brew shellenv || /usr/local/bin/brew shellenv)"

# Use Brewfile for packages
if [ -f "./Brewfile" ]; then
    echo "Installing packages from Brewfile..."
    brew bundle --file=./Brewfile
else
    echo "Brewfile not found. Skipping package installation."
fi

# Install Volta and Node
if ! command -v volta >/dev/null 2>&1; then
    echo "Installing Volta..."
    curl https://get.volta.sh | bash
    export VOLTA_HOME="$HOME/.volta"
    export PATH="$VOLTA_HOME/bin:$PATH"
    volta install node
else
    echo "Volta already installed."
fi

# Install global npm packages
if command -v npm >/dev/null 2>&1; then
    echo "Installing global npm packages..."
    npm i -g neovim intelephense bash-language-server \
      dockerfile-language-server-nodejs yaml-language-server \
      typescript typescript-language-server vscode-langservers-extracted \
      @fsouza/prettierd
else
    echo "npm not found."
fi

# Install Rust and Cargo
if ! command -v cargo >/dev/null 2>&1; then
    echo "Installing Rust..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source "$HOME/.cargo/env"
else
    echo "Rust already installed."
fi

# Install Stylua
if command -v cargo >/dev/null 2>&1; then
    cargo install stylua
fi

# Stow dotfiles
if [ -d "$HOME/.dotfiles" ]; then
    echo "Stowing dotfiles..."
    cd "$HOME/.dotfiles"
    stow git
    stow nvim
    stow bpytop
    stow mpv
    stow ghostty
    stow starship
    stow tmux
else
    echo "Dotfiles directory not found."
fi

#Add tpm for tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Set Fish shell as default if installed
if command -v fish >/dev/null 2>&1; then
    FISH_PATH="$(which fish)"
    if ! grep -q "$FISH_PATH" /etc/shells; then
        echo "Adding $FISH_PATH to /etc/shells"
        echo "$FISH_PATH" | sudo tee -a /etc/shells
    fi
    echo "Setting Fish as default shell..."
    chsh -s "$FISH_PATH"
else
    echo "Fish shell not found, skipping shell change."
fi
echo "✅ macOS setup complete!"
