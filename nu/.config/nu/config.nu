# config.nu
#
# Installed by:
# version = "0.107.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# Nushell sets "sensible defaults" for most configuration settings,
# so your `config.nu` only needs to override these defaults if desired.
#
# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R

$env.config.history.file_format = "sqlite"
$env.config.show_banner = false
alias vim = nvim +only -o
alias nocors = ^bash -c 'open -n -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --args --user-data-dir="/tmp/chrome_dev_test" --disable-web-security'
alias vpn = ^sudo openvpn --config $"($env.HOME)/vpn/.config/config.ovpn"
alias pn = pnpm

# argc-completions
$env.ARGC_COMPLETIONS_ROOT = '/Users/alexdickson3/argc-completions'
$env.ARGC_COMPLETIONS_PATH = ($env.ARGC_COMPLETIONS_ROOT + '/completions/macos:' + $env.ARGC_COMPLETIONS_ROOT + '/completions')
$env.PATH = ($env.PATH | prepend ($env.ARGC_COMPLETIONS_ROOT + '/bin'))
argc --argc-completions nushell | save -f '/Users/alexdickson3/argc-completions/tmp/argc-completions.nu'
source '/Users/alexdickson3/argc-completions/tmp/argc-completions.nu'
$env.PROMPT_COMMAND_RIGHT = { "" }
$env.PROMPT_INDICATOR = " "