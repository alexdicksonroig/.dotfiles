export BASH_SILENCE_DEPRECATION_WARNING=1
export PATH="/opt/homebrew/opt/llvm@12/bin:/opt/homebrew/bin:/opt/homebrew/sbin:$HOME/.local/bin:$HOME/.local/bin/helix-25.01.1-aarch64-macos/:$PATH"
export EDITOR="nvim"

alias vim="nvim +only -o"
alias j="jj"
alias g="git"
alias gad="git add ."
alias vpn="sudo openvpn --config ~/vpn/.config/config.ovpn"

if [[ -f "$HOME/.env" ]]; then
  set -a
  . "$HOME/.env"
  set +a
fi
. "$HOME/.cargo/env"

. "$HOME/.atuin/bin/env"
[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh

export PS1='\[\e[32m\][\A]\[\e[0m\] \w \$ '

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(atuin init bash)"

if command -v starship >/dev/null 2>&1; then
  eval "$(starship init bash)"
fi

bind '"\e[A": history-search-backward'

# Vite+ bin (https://viteplus.dev)
. "/Users/alexdickson3/.config/vite-plus/env"
