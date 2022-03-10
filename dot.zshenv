# Aliases
alias be='bundle exec'
alias dc='docker-compose'
alias dcu='docker-compose up'
alias dcd='docker-compose down'
alias dcrc='docker-compose exec rails bin/rails c'
alias dcbs='docker-compose exec rails bash'

export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH=$PATH:/Users/fugakkbn/.nodebrew/current/bin

eval "$(starship init zsh)"

# gitコマンドのタブ補完を有効にする
fpath=(
  ${HOME}/.zsh/completions
  ${fpath}
)
autoload -Uz compinit
compinit

# pecoで ctrl + ] に検索をバインドする
function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src
