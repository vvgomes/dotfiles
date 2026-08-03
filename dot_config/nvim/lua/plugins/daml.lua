return {
  "Sengoku11/daml.nvim",
  ft = "daml",
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- syntax highlighting
    "saghen/blink.cmp", -- autocompletion
    "MeanderingProgrammer/render-markdown.nvim", -- pretty script results
  },
  keys = {
    { "<leader>gt", "<cmd>DamlRunScript<cr>", desc = "Run Daml Script" },
  },
  opts = {
    lsp = { cmd = { "dpm", "damlc", "multi-ide" } },
  },
}
