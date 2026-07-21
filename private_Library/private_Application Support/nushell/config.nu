# See https://www.nushell.sh/book/configuration.html
# Full config: config nu --doc | nu-highlight | less -R

$env.SHELL = "/opt/homebrew/bin/nu"

# Tools
$env.PATH = ($env.PATH | prepend "/usr/local/sbin")
$env.PATH = ($env.PATH | prepend "/usr/local/bin")
$env.PATH = ($env.PATH | prepend "/opt/homebrew/bin")
$env.PATH = ($env.PATH | prepend "/opt/homebrew/sbin")
$env.PATH = ($env.PATH | prepend "/opt/homebrew/opt/openjdk/bin")
$env.PATH = ($env.PATH | prepend "/usr/local/opt/curl/bin")
$env.PATH = ($env.PATH | prepend $"($env.HOME)/.local/bin")

# Basic preferences
$env.config.show_banner = false
$env.EDITOR = "nvim"
$env.config.buffer_editor = "nvim"
$env.config.edit_mode = "vi"
$env.config.history.isolation = false
$env.config.datetime_format.normal = "%Y-%m-%d %I:%M:%S%p"
$env.LEIN_JVM_OPTS = "-Daether.dependencyCollector.impl=bf"
$env.GITHUB_TOKEN = (^gh auth token | str trim)

# Aliases
alias nu-open = open
alias open = ^open
alias g = git
alias vim = nvim
alias ff = fzf --preview "bat --color=always --style=numbers --line-range :500 {}"
alias browse = yazi
alias lg = ^lazygit
alias hl = nu-highlight
alias idea = open -a "IntelliJ IDEA CE" .
alias projects = tuido

# Functions

def brew-recent [] {
  brew info --json=v2 --installed
    | from json
    | get formulae
    | upsert install_time { |p| $p.installed.0.time }
    | select name install_time
    | sort-by install_time --reverse
    | explore
}

# Prompt
$env.PROMPT_INDICATOR = "❭ "
$env.PROMPT_MULTILINE_INDICATOR = " ::: "
$env.PROMPT_COMMAND = {||
  let dir_name = ($env.PWD | str replace $env.HOME "~" | path basename)
  let git_branch = (do -i { git branch --show-current } | complete | get stdout | str trim)

  let dir_part = $"(ansi blue) ($dir_name)(ansi reset)"
  let git_part = if ($git_branch | is-empty) { "" } else { $" (ansi magenta)($git_branch)(ansi reset)" }

  $"($dir_part)($git_part)"
}

# Prompt: VI Normal mode
#  daily main 󰰔 ❭
$env.PROMPT_INDICATOR_VI_NORMAL = $" (ansi blue)󰰔 (ansi reset)(ansi green)❭ (ansi reset)"

# Prompt: VI Insert mode
#  daily main  ❭
$env.PROMPT_INDICATOR_VI_INSERT = $" (ansi yellow) (ansi reset)(ansi green)❭ (ansi reset)"

# Prompt: right side
# 󰃰 2025-10-15 11:54:13
$env.PROMPT_COMMAND_RIGHT = {|| date now | format date "󰃰 %Y-%m-%d %H:%M:%S" }

