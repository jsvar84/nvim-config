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

## Configuration

### Theme

Currently set to **catppuccin**. NvChad uses its own `base46` theme system — the
standard `:colorscheme` command will always report "default", which is normal.

To change the theme, edit `lua/chadrc.lua`:

```lua
M.base46 = {
  theme = "catppuccin", -- change to any NvChad theme name
}
```

Run `:lua require("nvchad.themes").open()` (or `<leader>th`) to preview and
switch themes live.

### Dashboard

The [nvdash](https://nvchad.com/docs/features#nvdash) dashboard is enabled and
loads on startup. To disable it, comment out the line in `lua/chadrc.lua`:

```lua
-- M.nvdash = { load_on_startup = true }
```

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

`<leader>` is `Space`.

### Navigation

| Key | Action |
|-----|--------|
| `<Tab>` | Next buffer |
| `<S-Tab>` | Previous buffer |
| `<leader>x` | Close buffer |
| `<C-h/j/k/l>` | Move between windows |
| `<C-n>` | Toggle file tree |
| `<leader>e` | Focus file tree |

### File & Search

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fw` | Live grep |
| `<leader>fb` | Find open buffers |
| `<leader>fo` | Recent files |
| `<leader>th` | Switch theme |

### Editing

| Key | Action | Mode |
|-----|--------|------|
| `<C-s>` | Save file | Normal, Insert, Visual |
| `<leader>fm` | Format file | Normal |
| `<leader>/` | Toggle comment | Normal, Visual |
| `;` | Enter command mode | Normal |
| `jk` | Exit insert mode | Insert |

### Windows & Splits

| Key | Action |
|-----|--------|
| `<leader>sv` | Vertical split |
| `<leader>sh` | Horizontal split |
| `<leader>v` | New vertical terminal |
| `<leader>h` | New horizontal terminal |
| `<A-i>` | Toggle floating terminal |

### LSP

| Key | Action |
|-----|--------|
| `<leader>ds` | Diagnostics list |
| `<leader>wK` | Show all keymaps (WhichKey) |

## Verifying the Installation

To test a clean install without touching your live config, use isolated XDG
directories:

```sh
# Create a temporary environment
mkdir -p /tmp/nvim-test/{config,data,state,cache}

# Clone fresh
git clone https://github.com/jsvar84/nvim-config /tmp/nvim-test/config/nvim

# Bootstrap and install all plugins headlessly
XDG_CONFIG_HOME=/tmp/nvim-test/config \
XDG_DATA_HOME=/tmp/nvim-test/data \
XDG_STATE_HOME=/tmp/nvim-test/state \
XDG_CACHE_HOME=/tmp/nvim-test/cache \
nvim --headless "+Lazy! sync" +qa

# Confirm 26 plugins were installed
ls /tmp/nvim-test/data/nvim/lazy/ | wc -l

# Clean up
rm -rf /tmp/nvim-test
```

Expected output: all plugins clone without errors and the final command exits 0.
