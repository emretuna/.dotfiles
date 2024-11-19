source "$HOME/.config/fish/alias.fish"

set -Ux CARAPACE_BRIDGES 'zsh,fish,bash,inshellisense' # optional
carapace _carapace | source

export EDITOR=nvim
export DIRENV_LOG_FORMAT=

# Set theme
set -g theme 'kanagawa-dragon'

# Remove greeting
set fish_greeting

## Set default editor
set -Ux fifc_editor nvim
set -U fifc_keybinding \cf

# Use 256 color terminal
set -gx TERM xterm-256color

# Add volta to PATH
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

# Add navi source to fish
navi widget fish | source

# Add starship source to fish
starship init fish | source

# Add composer vendor bin to PATH
set -U fish_user_paths $HOME/.composer/vendor/bin
