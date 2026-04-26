shopt -s histappend
export HISTSIZE=100000
export HISTFILESIZE=100000
export HISTCONTROL=ignoredups
unset HISTIGNORE

export BASH_SILENCE_DEPRECATION_WARNING=1
export PATH="/opt/homebrew/opt/llvm@12/bin:/opt/homebrew/bin:/opt/homebrew/sbin:$HOME/.local/bin:$HOME/.local/bin/helix-25.01.1-aarch64-macos/:$PATH"

alias vim="nvim +only -o"

alias vpn="sudo openvpn --config ~/vpn/.config/config.ovpn"

if [[ -f "$HOME/.env" ]]; then
  set -a
  . "$HOME/.env"
  set +a
fi
. "$HOME/.cargo/env"
. "$HOME/.atuin/bin/env"
eval "$(atuin init bash)"

[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
bind '"\e[A": history-search-backward'

# Show current time in green and the working directory in the prompt.
export PS1='\[\e[32m\]\A\[\e[0m\] \w \$ '

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# opencode
export PATH=/Users/alexdickson3/.opencode/bin:$PATH
