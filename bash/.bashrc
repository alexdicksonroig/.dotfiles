PS1='\[\e[1;32m\]\A \[\e[1;34m\]\w \[\e[1;33m\]$(git branch 2>/dev/null | grep "*" | sed "s/* //")\[\e[0m\] $ '

ENABLE_MACROS=true

if [[ -z $(pgrep kmonad) && $ENABLE_MACROS = true ]]; then
  if ! tmux has-session -t=$kmonad  2> /dev/null; then
    tmux new-session -d -s $kmonad
  fi
  tmux send-keys -t $kmonad "sudo kmonad ./kmonad.kbd" Enter
fi

myCustomWidget() {
  tmux-sessionizer
}
zle -N myCustomWidget

bindkey "^f" myCustomWidget

alias nocors="open -n -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --args --user-data-dir="/tmp/chrome_dev_test" --disable-web-security"
alias vim="nvim +only -o"
alias vi="nvim +only -o"

# Git
alias gst="git status"
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
alias gdi='git diff'
alias gds='git diff --staged'
alias gas='git add . && git stash'
alias gd='gitdick'
alias gco="git checkout"
alias gb='git branch --sort=-committerdate'

# Docker
alias dco="docker compose"
alias dps="docker ps"
alias dpa="docker ps -a"
alias dl="docker ps -l -q"
alias dx="docker exec -it"

source $HOME/.env
export PATH="$PATH:$HOME/.dotfiles/scripts/.local/bin/"
