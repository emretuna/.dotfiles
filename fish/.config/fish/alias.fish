# System aliases
alias q="exit"
alias cat="bat"

# Text editor alises
alias c="code"
alias ch="code ."
alias v="nvim"
alias vh="nvim ."
alias vi="nvim"
alias vim="nvim"

# command config aliases
alias fc="cd ~/.config/fish && nvim ~/.config/fish/config.fish"
alias fa="cd ~/.config/fish/alias.fish && nvim ~/.config/fish/alias.fish"
alias fs="source ~/.config/fish/config.fish"
alias vc="nvim ~/.config/nvim"
alias gc="nvim ~/.config/ghostty/config"
alias tc="nvim ~/.tmux.conf"
alias ac="nvim ~/.config/aerospace/aerospace.toml"

alias ts="tmux source-file ~/.tmux.conf"
alias tk "tmux kill-session"
alias ta="tmux new-session -A -s Work"

# NPM aliases
alias nrd="npm run dev"
alias nrb="npm run build"

# docker aliases
alias dcu="docker-compose up -d"
alias dcd="docker-compose down"

# git aliases
alias lg="lazygit"
alias ghs="git status"
alias gha="git add"
alias ghc="git commit -m"
