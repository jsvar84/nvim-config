return {
  -- auto-install Python LSP servers via Mason
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      ensure_installed = { "pyright", "ruff" },
    },
  },

  -- extend NvChad LSP defaults with Python (pyright + ruff)
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.python"
    end,
  },

  -- Python formatting via ruff
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff_format" },
      },
    },
  },
}
