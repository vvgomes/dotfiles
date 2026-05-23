return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clojure_lsp = {
          mason = false,
        },
      },
    },
  },
  {
    "Olical/conjure",
    init = function()
      vim.g["conjure#mapping#def_word"] = "<localleader>gd"
      vim.g["conjure#mapping#doc_word"] = "<localleader>K"
    end,
  },
}
