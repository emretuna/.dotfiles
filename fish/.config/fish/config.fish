source "$HOME/.config/fish/alias.fish"
export EDITOR=nvim
export DIRENV_LOG_FORMAT=
# Remove greeting
set fish_greeting
# Use 256 color terminal
set -x TERM xterm-256color

# Add volta to PATH
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

# Add navi source to fish
navi widget fish | source

# Add starship source to fish
starship init fish | source

# Add composer vendor bin to PATH
set -U fish_user_paths $HOME/.composer/vendor/bin
