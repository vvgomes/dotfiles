return {
  "nvim-treesitter/nvim-treesitter",
  init = function()
    vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/site/")
  end,
}
