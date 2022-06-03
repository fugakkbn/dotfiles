# Aliases
alias g='git'
alias gcf='git commit --fixup'
alias gri='git rebase -i'
alias n='nvim'
alias rs='bin/rails s'
alias rc='bin/rails c'
alias be='bundle exec'
alias bi='bundle install'
alias cop='bundle exec rubocop'
alias sp='bundle exec rspec'
alias dc='docker compose'
alias dcu='docker compose up'
alias dcd='docker compose down'
alias dce='(){docker compose exec $1 $2}'
alias dcrc='(){docker compose exec $1 bin/rails c}'
alias dcbe='(){docker compose exec $1 bundle exec $2}'
alias dcbs='(){docker compose exec $1 bash}'

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

# peco で ctrl + h に実行コマンド検索をバインド
function peco-select-history() {
  BUFFER=$(\history -n -r 1 | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
}
zle -N peco-select-history
bindkey '^h' peco-select-history

# peco で ff にファイル検索をバインド
function peco-find-file-name() {
  BUFFER=$(find . -name "*${1}*" | grep -v "/\." | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
}
zle -N peco-find-file-name
bindkey 'ff' peco-find-file-name
