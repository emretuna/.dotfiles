export ZSH_DOTENV_FILE="$HOME/.env"
ZSH_DOTENV_PROMPT=false
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ${ZDOTDIR:-~}/.zshrc
# Set the root name of the plugins files (.txt and .zsh) antidote will use.
zsh_plugins=${ZDOTDIR:-~}/.zsh_plugins

# Ensure the .zsh_plugins.txt file exists so you can add plugins.
[[ -f ${zsh_plugins}.txt ]] || touch ${zsh_plugins}.txt

# Lazy-load antidote from its functions directory.
fpath=(/opt/homebrew/opt/antidote/share/antidote/functions $fpath)
autoload -Uz antidote

# Generate a new static file whenever .zsh_plugins.txt is updated.
if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
  antidote bundle <${zsh_plugins}.txt >|${zsh_plugins}.zsh
fi

# Source your static plugins file.
source ${zsh_plugins}.zsh
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

case `uname` in
  Linux)
    ## add brew home to PATH in linux/WSL
    brew_home=/home/linuxbrew/.linuxbrew
    if [ -d "${brew_home}" ]; then
      export PATH=${brew_home}/bin:$PATH
    fi
esac
# Supports a bin directory inside home directory
export PATH="${HOME}/bin:${HOME}/.local/bin:${HOME}/.composer/vendor/bin:${PATH}"

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


# zsh-autosuggestions settings.
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

## User configuration

# Exports
source $HOME/.zshrc.d/.exports

# Functions
source $HOME/.zshrc.d/.functions

# Aliases
source $HOME/.zshrc.d/.aliases


# <Alt-s> to search most common projects (personal, work) and
# open selected in a sessh.
function sesh-sessions() {
  {
    exec </dev/tty
    exec <&1
    local session
    session=$(sesh list -t -c | fzf --height 40% --reverse --border-label ' sesh ' --border --prompt '⚡  ')
    [[ -z "$session" ]] && return
    sesh connect $session
  }
}

zle     -N             sesh-sessions
bindkey -M emacs '\es' sesh-sessions
bindkey -M vicmd '\es' sesh-sessions
bindkey -M viins '\es' sesh-sessions

# direnv package
# https://direnv.net/
# installed via homebrew
# used because of flexshopper/payment-plugin-3
# https://flexshopper.atlassian.net/wiki/spaces/DEV/pages/1377697814/Getting+Started+pp3
eval "$(direnv hook zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# Add Pywal support
#(cat ~/.cache/wal/sequences &)
#source ~/.cache/wal/colors-tty.sh

# Use modern completion system. Other than enabling globdots for showing
# hidden files, these ares values in the default generated zsh config.
	# Load brew completions
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
## Enable fzf-tab completions
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

eval "$(navi widget zsh)"

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

if [ -d "/opt/homebrew/opt/ruby/bin" ]; then
  export PATH=/opt/homebrew/opt/ruby/bin:$PATH
  export PATH=`gem environment gemdir`/bin:$PATH
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
