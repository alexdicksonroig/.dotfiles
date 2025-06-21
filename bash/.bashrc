export BASH_SILENCE_DEPRECATION_WARNING=1
export PATH="/opt/homebrew/opt/llvm@12/bin:/opt/homebrew/bin:/opt/homebrew/sbin:$HOME/.local/bin:$HOME/.local/bin/helix-25.01.1-aarch64-macos/:$PATH"

# PS1='\[\e[1;32m\]\A \[\e[1;34m\]\w \[\e[1;33m\]$(git branch 2>/dev/null | grep "*" | sed "s/* //")\[\e[0m\] $ '
PS1='\[\e[1;34m\]\w\[\e[0m\]$(git branch 2>/dev/null | grep "*" | sed "s/* / /")\[\e[0m\] $ '
# PS1='\[\e[1;34m\]\w \[\e[1;33m\] \[\e[0m\]$'

ENABLE_MACROS=true
kmonad="kmonad"

if [ -f /usr/local/etc/bash_completion ]; then
  . /usr/local/etc/bash_completion
fi

if [[ -z $(pgrep kmonad) && $ENABLE_MACROS = true ]]; then
  if ! tmux has-session -t=$kmonad  2> /dev/null; then
    tmux new-session -d -s $kmonad
    tmux send-keys -t $kmonad "sudo kmonad ./kmonad.kbd" Enter

    if [[ -n "$TMUX" ]]; then
      tmux switch-client -t $kmonad
    else
      tmux attach-session -t $kmonad
    fi
  fi
fi

bind -x '"\C-f": tmux-sessionizer'

alias nocors="open -n -a /Applications/Brave\ Browser.app/Contents/MacOS/Brave\ Browser --args --user-data-dir="/tmp/brave_dev_sess_1" --disable-web-security"
alias vim="nvim +only -o"

# Git
alias gst="git status"
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
alias gdi='git diff'
alias gds='git diff --staged'
alias gas='git add . && git stash'
alias gco="git checkout"
alias gb='git branch --sort=-committerdate'

# Docker
alias dco="docker compose"
alias dps="docker ps"
alias dpa="docker ps -a"
alias dl="docker ps -l -q"
alias dx="docker exec -it"

alias vpn="sudo openvpn --config ~/vpn/.config/config.ovpn"

source $HOME/.env

. "$HOME/.cargo/env"
