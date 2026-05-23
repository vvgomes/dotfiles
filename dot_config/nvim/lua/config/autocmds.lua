-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Make window separators more visible with Tokyo Night colors
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    -- Tokyo Night border color
    vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#565f89", bold = true })
    -- Add statusline separator
    vim.api.nvim_set_hl(0, "StatusLine", { link = "Normal" })
    vim.api.nvim_set_hl(0, "StatusLineNC", { link = "Normal" })
  end,
})

-- Apply immediately
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#565f89", bold = true })
vim.api.nvim_set_hl(0, "StatusLine", { link = "Normal" })
vim.api.nvim_set_hl(0, "StatusLineNC", { link = "Normal" })

-- Read files inside JARs for go-to-definition from clojure-lsp
-- clojure-lsp returns zipfile:///path/to.jar::path/file.clj URIs
vim.api.nvim_create_autocmd("BufReadCmd", {
  pattern = "zipfile://**",
  callback = function()
    local uri = vim.fn.expand("<amatch>")
    local jar_path, inner_path = uri:match("^zipfile:///(.+)::(.+)$")
    if not jar_path then
      jar_path, inner_path = uri:match("^zipfile://(.+)::(.+)$")
    end
    if not jar_path or not inner_path then
      vim.notify("Cannot parse zipfile URI: " .. uri, vim.log.levels.ERROR)
      return
    end
    jar_path = vim.uri_decode(jar_path)
    inner_path = vim.uri_decode(inner_path)
    local result = vim.fn.system({ "unzip", "-p", "--", jar_path, inner_path })
    if vim.v.shell_error ~= 0 then
      vim.notify("unzip failed for " .. jar_path .. " :: " .. inner_path, vim.log.levels.ERROR)
      return
    end
    local lines = vim.split(result, "\n", { plain = true })
    if #lines > 0 and lines[#lines] == "" then
      table.remove(lines)
    end
    vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
    vim.bo[0].modified = false
    vim.bo[0].filetype = vim.filetype.match({ name = inner_path, bufnr = 0 })
  end,
})

-- 4-space identation for Java only
vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function()
    vim.bo.shiftwidth = 4
    vim.bo.tabstop = 4
  end,
})
