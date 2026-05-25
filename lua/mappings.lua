require "nvchad.mappings"

-- add yours here
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- <C-s> save in insert & visual (NvChad covers normal mode)
map({ "i", "v" }, "<C-s>", "<cmd>w<cr>", { desc = "Save file" })

-- window splits (NvChad's <leader>h/v open terminals, not splits)
map("n", "<leader>sv", "<cmd>vsplit<cr>", { desc = "Vertical split" })
map("n", "<leader>sh", "<cmd>split<cr>", { desc = "Horizontal split" })
