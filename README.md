# nvim-config

Personal Neovim configuration built on [NvChad](https://nvchad.com/) v2.5 with [lazy.nvim](https://github.com/folke/lazy.nvim).

## Requirements

- [Neovim](https://neovim.io/) >= 0.11
- [Git](https://git-scm.com/) >= 2.19
- A [Nerd Font](https://www.nerdfonts.com/) (for icons)
- `gcc` or `clang` (for Treesitter parsers)
- `ripgrep` (optional, for Telescope live grep)

On macOS with Homebrew:

```sh
brew install neovim ripgrep
```

## Installation

> **Backup your existing config first:**
> ```sh
> mv ~/.config/nvim ~/.config/nvim.bak
> mv ~/.local/share/nvim ~/.local/share/nvim.bak
> ```

Clone this repo into your Neovim config directory:

```sh
git clone https://github.com/jsvar84/nvim-config ~/.config/nvim
```

Launch Neovim — lazy.nvim will bootstrap itself and install all plugins automatically:

```sh
nvim
```

Wait for the installation to complete, then restart Neovim.

## Structure

```
~/.config/nvim/
├── init.lua              # Entry point — bootstraps lazy.nvim
├── lazy-lock.json        # Locked plugin versions
└── lua/
    ├── chadrc.lua        # NvChad theme & UI options
    ├── options.lua       # Vim options
    ├── mappings.lua      # Custom keymaps
    ├── autocmds.lua      # Autocommands
    ├── configs/
    │   └── lazy.lua      # lazy.nvim configuration
    ├── plugins/
    │   └── init.lua      # Custom plugins (add yours here)
    └── nvchad/           # NvChad core (plugins, configs, mappings)
```

## Customization

### Changing the theme

Edit `lua/chadrc.lua`:

```lua
M.base46 = {
  theme = "catppuccin", -- any NvChad theme name
}
```

Run `:Telescope themes` inside Neovim to preview all available themes.

### Adding plugins

Add entries to `lua/plugins/init.lua`:

```lua
return {
  {
    "github/copilot.vim",
    lazy = false,
  },
}
```

## Plugin Management

| Command | Action |
|---------|--------|
| `:Lazy` | Open plugin manager UI |
| `:Lazy sync` | Update all plugins |
| `:Lazy clean` | Remove unused plugins |
| `:Mason` | Manage LSP servers, linters, formatters |

## Key Mappings

`<leader>` is set to `Space`.

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files (Telescope) |
| `<leader>fw` | Live grep |
| `<leader>e` | Toggle file tree |
| `<leader>th` | Switch theme |
| `<C-n>` | Toggle NvimTree |
| `;` | Enter command mode |
| `jk` | Exit insert mode |
