#!/usr/bin/env fish

cd ~

# Install Homebrew
if not command -v brew &>/dev/null
    echo "Installing Homebrew, a macOS package manager. Follow the instructions..."
    /bin/bash -c "(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add Homebrew to PATH for Fish shell
    if test -e /opt/homebrew/bin/brew
        eval (/opt/homebrew/bin/brew shellenv)
    else if test -e /usr/local/bin/brew
        eval (/usr/local/bin/brew shellenv)
    end

    # Add Homebrew's shell environment to config.fish
    echo 'eval (/opt/homebrew/bin/brew shellenv)' >> ~/.config/fish/config.fish
else
    echo "You already have Homebrew installed...good job!"
end

# Update PATH
fish_add_path /usr/local/bin


# Install packages
brew install neovim stow yarn fzf fd ripgrep ast-grep bat direnv btop ffmpegthumbnailer unar jq trash lua-language-server vale zoxide shellcheck stylua languagetool tree poppler gitui exa volta starship grpcurl websocat

# Install fonts
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font font-commit-mono-nerd-font

brew cleanup

cd $HOME/.dotfiles
echo "Stowing files..."
# Stow dotfiles
stow git fish nvim btop mpv wezterm starship

# Starship init
echo "starship init fish | source" >> ~/.config/fish/config.fish

# Volta init
echo 'set -gx VOLTA_HOME "$HOME/.volta"' >> ~/.config/fish/config.fish
echo 'fish_add_path $VOLTA_HOME/bin' >> ~/.config/fish/config.fish
# Install Volta and Node.js
if not command -v volta &>/dev/null
    curl https://get.volta.sh | bash
    source ~/.config/fish/config.fish
    volta install node
else
    echo "You already have Volta installed...good job!"
end

# Install global npm packages
if command -v npm &>/dev/null
    echo "Installing global npm packages..."
    npm i -g neovim intelephense bash-language-server dockerfile-language-server-nodejs yaml-language-server typescript typescript-language-server vscode-langservers-extracted @fsouza/prettierd
else
    echo "npm not found. Make sure Node.js is installed correctly."
end

# Install Rust and Cargo
if not command -v cargo &>/dev/null
    echo "Installing Rust and Cargo..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    source $HOME/.cargo/env
else
    echo "Rust and Cargo are already installed."
end

# Install stylua using Cargo
cargo install stylua

echo "Setup complete! Enjoy your new macOS environment!"
