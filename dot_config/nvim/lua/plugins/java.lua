return {
  {
    "mfussenegger/nvim-jdtls",
    opts = function(_, opts)
      opts.settings = vim.tbl_deep_extend("force", opts.settings or {}, {
        java = {
          inlayHints = {
            parameterNames = {
              enabled = "none",
            },
          },
        },
      })
    end,
  },
  {
    "mfussenegger/nvim-dap",
  },
}
