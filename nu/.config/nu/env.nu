# env.nu
#
# Installed by:
# version = "0.107.0"
#
# Previously, environment variables were typically configured in `env.nu`.
# In general, most configuration can and should be performed in `config.nu`
# or one of the autoload directories.
#
# This file is generated for backwards compatibility for now.
# It is loaded before config.nu and login.nu
#
# See https://www.nushell.sh/book/configuration.html
#
# Also see `help config env` for more options.
#
# You can remove these comments if you want or leave
# them for future reference.

$env.EDITOR = "nvim"
$env.PATH = [
    "/opt/homebrew/opt/llvm@12/bin",
    "/opt/homebrew/bin",
    "/opt/homebrew/sbin",
    $"($env.HOME)/.local/bin",
    $"($env.HOME)/.opencode/bin"
    "/sbin"
] ++ $env.PATH