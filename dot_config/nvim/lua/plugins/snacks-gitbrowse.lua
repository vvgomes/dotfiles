return {
  {
    "folke/snacks.nvim",
    opts = {
      gitbrowse = {
        -- Snacks applies these patterns in order to turn a git remote URL
        -- into a browsable https URL. It does NOT resolve SSH host aliases
        -- from ~/.ssh/config, so aliases like `github-dtcc` (whose real
        -- HostName is github.com) leak into the browser URL and break it.
        --
        -- We prepend alias-rewrite rules, then keep all of Snacks' defaults.
        remote_patterns = {
          -- Rewrite the `github-dtcc` SSH alias back to github.com.
          { "^git@github%-dtcc:(.+)%.git$", "https://github.com/%1" },
          { "^git@github%-dtcc:(.+)$", "https://github.com/%1" },

          -- Snacks defaults (kept intact).
          { "^(https?://.*)%.git$", "%1" },
          { "^git@(.+):(.+)%.git$", "https://%1/%2" },
          { "^git@(.+):(.+)$", "https://%1/%2" },
          { "^git@(.+)/(.+)$", "https://%1/%2" },
          { "^org%-%d+@(.+):(.+)%.git$", "https://%1/%2" },
          { "^ssh://git@(.*)$", "https://%1" },
          { "^ssh://([^:/]+)(:%d+)/(.*)$", "https://%1/%3" },
          { "^ssh://([^/]+)/(.*)$", "https://%1/%2" },
          { "ssh%.dev%.azure%.com/v3/(.*)/(.*)$", "dev.azure.com/%1/_git/%2" },
          { "^https://%w*@(.*)", "https://%1" },
          { "^git@(.*)", "https://%1" },
          { ":%d+", "" },
          { "%.git$", "" },
        },
      },
    },
  },
}
