-- Python LSP configuration

-- pyright: type checking, completions, hover
vim.lsp.config("pyright", {
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "openFilesOnly",
      },
    },
  },
})

-- ruff: fast linting and code actions
vim.lsp.config("ruff", {
  init_options = {
    settings = {
      lineLength = 88,
    },
  },
})

vim.lsp.enable { "pyright", "ruff" }
