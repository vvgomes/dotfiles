use power
use power/plugin/git.nu *
use power/plugin/kube.nu *
$env.NU_POWER_SCHEMA = [
    [
        [source, color];
        [pwd, xterm_grey23]
        [git, xterm_grey30]
    ],
    [
        [source, color];
        [proxy, xterm_grey39]
        [host, xterm_grey30]
        [kube, xterm_grey23]
        [time, xterm_grey27]
    ]
]
## {{{ Simplified style
$env.NU_POWER_DECORATOR = 'plain'
$env.NU_POWER_FRAME = 'fill'
$env.NU_POWER_FRAME = 'center'
$env.NU_POWER_CONFIG.theme.separator_bar.char = "-"
## }}}
power set time {
    style: compact
}
power set kube {
    theme: {
        context: (ansi cyan)
    }
    reverse: true
    separator: '@'
}
power init
