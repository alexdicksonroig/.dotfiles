source ./.env
export KITTY_CONFIG_DIRECTORY='$HOME/.config/kitty/'
# source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# plugins=(zsh-autosuggestions zsh-syntax-highlighting)
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  #source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi
#ZSH_THEME="powerlevel10k/powerlevel10k"
#source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Custom prompt line
kmonad="kmonad"
ENABLE_MACROS=true

if [[ -z $(pgrep kmonad) && $ENABLE_MACROS = true ]]; then
  if ! tmux has-session -t=$kmonad  2> /dev/null; then
    tmux new-session -d -s $kmonad
  fi
  tmux send-keys -t $kmonad "sudo kmonad ./kmonad.kbd" Enter
fi

autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b '
setopt PROMPT_SUBST
PROMPT='%F{white}%*%f %F{white}%~%f %F{cyan}${vcs_info_msg_0_}%f$ '
ZSH_CUSTOM=~/.oh-my-zsh/custom
bindkey "^R" history-incremental-search-backward
bindkey "\e[A" history-beginning-search-backward
bindkey "\e[B" history-beginning-search-forward
# Example
myCustomWidget() {
  tmux-sessionizer
}
zle -N myCustomWidget

# bind to control + O
bindkey "^f" myCustomWidget
alias macro="sudo kmonad ./kmonad.kbd"

alias nocors="open -n -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --args --user-data-dir="/tmp/chrome_dev_test" --disable-web-security"
alias vim="nvim +only -o"
alias vi="nvim +only -o"
alias gdi='git diff'
alias gds='git diff --staged'
alias gd='gitdick'
alias sc='source ~/.zshrc; echo "Zsh sourced!"'
alias gas='git add . && git stash'
alias ..='cd ..'
# Git
alias gc="git commit -m"
alias gca="git commit -a -m"
alias gp="git push origin HEAD"
alias gpu="git pull origin"
alias gst="git status"
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
alias gdiff="git diff"
alias gco="git checkout"
alias gb='git branch --sort=-committerdate'
alias gba='git branch -a'
alias gadd='git add'
alias ga='git add -p'
alias gcoall='git checkout -- .'
alias gr='git remote'
alias gre='git reset'
alias gm='git merge'

# Docker
alias dco="docker compose"
alias dps="docker ps"
alias dpa="docker ps -a"
alias dl="docker ps -l -q"
alias dx="docker exec -it"

# Python
alias py="python3"
alias m="python3 manage.py"

# Go
alias air='$(go env GOPATH)/bin/air'
autoload -U compinit && compinit
zmodload -i zsh/complist

export PATH="/opt/homebrew/opt/llvm@12/bin:/Users/alexdickson2/.local/bin:/opt/homebrew/opt/:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

[ -f "/Users/alexdickson2/.ghcup/env" ] && . "/Users/alexdickson2/.ghcup/env" # ghcup-env


### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/alexdickson2/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
