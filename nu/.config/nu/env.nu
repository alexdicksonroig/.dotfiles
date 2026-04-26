# argc-completions
$env.ARGC_COMPLETIONS_ROOT = '/Users/alexdickson3/Projects/ife-app2/argc-completions'
$env.ARGC_COMPLETIONS_PATH = ($env.ARGC_COMPLETIONS_ROOT + '/completions/macos:' + $env.ARGC_COMPLETIONS_ROOT + '/completions')
$env.PATH = ($env.PATH | prepend ($env.ARGC_COMPLETIONS_ROOT + '/bin'))

source $"($nu.home-path)/.cargo/env.nu"
