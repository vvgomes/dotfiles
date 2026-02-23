-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- fixes clipboard for Nushell
vim.opt.clipboard = "unnamedplus"

-- no line wrap
vim.opt.wrap = false

-- no spell check, LazyVim enables it for markdown by default
vim.opt.spell = false

-- exec external commands with Nushell
vim.opt.shell = "/opt/homebrew/bin/nushell"
