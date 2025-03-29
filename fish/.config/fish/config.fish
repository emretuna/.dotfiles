source "$HOME/.config/fish/alias.fish"

export EDITOR=nvim
export DIRENV_LOG_FORMAT=
#export LANG=en_US.UTF-8
#export LC_ALL=en_US.UTF-8

# Remove greeting
set fish_greeting

## Set default editor
set -Ux fifc_editor nvim

# set -U fifc_keybinding \cf

# Use 256 color terminal
set -Ux COLORTERM truecolor

# Add volta to PATH
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

# Add navi source to fish
navi widget fish | source

# Add starship source to fish
starship init fish | source

# Add composer vendor bin to PATH
set -U fish_user_paths $HOME/.composer/vendor/bin

# pnpm
set -gx PNPM_HOME "/Users/emretuna/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
