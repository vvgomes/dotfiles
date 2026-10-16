-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- fixes clipboard for Nushell
vim.opt.clipboard = "unnamedplus"

-- exec external commands with Nushell
vim.opt.shell = "/opt/homebrew/bin/nu"
