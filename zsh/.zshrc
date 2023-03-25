# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Supports a bin directory inside home directory
export PATH=${HOME}/bin:${HOME}/.local/bin/:${PATH}

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=239"

export TERM=xterm-256color

### history
HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE
HISTFILESIZE=$HISTSIZE

# Avoid duplicates
HISTCONTROL=ignoredups:erasedups
# When the shell exits, append to the history file instead of overwriting it
# shopt -s histappend

# After each command, append to the history file and reread it
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"


# Export nvm completion settings for lukechilds/zsh-nvm plugin
# Note: This must be exported before the plugin is bundled
export NVM_DIR=${HOME}/.nvm
export NVM_COMPLETION=true

# zsh-autosuggestions settings.
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

source ${HOME}/.zsh_plugins.sh

## User configuration

# Exports
source $HOME/.zshrc.d/.exports

# Functions
source $HOME/.zshrc.d/.functions

# Aliases
source $HOME/.zshrc.d/.aliases


# <C-f> to search most common projects (personal, work) and
# open selected in a tmux session. source: The Primeagen
bindkey -s ^p "tmux-sessionizer\n"

# direnv package
# https://direnv.net/
# installed via homebrew
# used because of flexshopper/payment-plugin-3
# https://flexshopper.atlassian.net/wiki/spaces/DEV/pages/1377697814/Getting+Started+pp3
eval "$(direnv hook zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# Add Pywal support
#(cat ~/.cache/wal/sequences &)
#source ~/.cache/wal/colors-tty.sh

# Use modern completion system. Other than enabling globdots for showing
# hidden files, these ares values in the default generated zsh config.
autoload -U compinit
_comp_options+=(globdots)

zstyle ':completion:*' menu select=2
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''

# dircolors is a GNU utility that's not on macOS by default. With this not
# being used on macOS it means zsh's complete menu won't have colors.
command -v dircolors > /dev/null 2>&1 && eval "$(dircolors -b)"

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

# Use emacs keybindings even if your $EDITOR is set to Vim.
bindkey -e

# Ensure home / end keys continue to work.
bindkey '\e[1~' beginning-of-line
bindkey '\e[H' beginning-of-line
bindkey '\e[7~' beginning-of-line
bindkey '\e[4~' end-of-line
bindkey '\e[F' end-of-line
bindkey '\e[8~' end-of-line
bindkey '\e[3~' delete-char

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
