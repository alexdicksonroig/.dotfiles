export BASH_SILENCE_DEPRECATION_WARNING=1
export PATH="/opt/homebrew/opt/llvm@12/bin:/opt/homebrew/bin:/opt/homebrew/sbin:$HOME/.local/bin:$HOME/.local/bin/helix-25.01.1-aarch64-macos/:$PATH"

PS1='\[\e[1m\]\A \w $(git branch 2>/dev/null | grep "*" | sed "s/* //")\[\e[0m\] \$ '

alias vim="nvim +only -o"

alias vpn="sudo openvpn --config ~/vpn/.config/config.ovpn"

. $HOME/.env
. "$HOME/.cargo/env"
