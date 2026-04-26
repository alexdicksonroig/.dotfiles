$env.PROMPT_COMMAND = {||
    let dir = (pwd | str replace $nu.home-path "~")
    let has_changes = (try { ((jj st | complete).stdout | lines | length) > 4 } catch { false })

    if $has_changes {
        $"($dir)*"
    } else {
        $dir
    }
}
