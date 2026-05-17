if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
tmux() { if (($#)); then command tmux "$@"; else command tmux new-session -A -s 0; fi; }
. "$HOME/.cargo/env"

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.bash 2>/dev/null || :


. "$HOME/.atuin/bin/env"


# Added by Antigravity CLI installer
export PATH="/Users/alexdickson3/.local/bin:$PATH"
