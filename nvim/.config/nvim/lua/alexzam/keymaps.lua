local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- behave like the rest of the CAPITAL letters
keymap("n", "Y", "y$", opts)
-- keeping it centered
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Telescope
keymap("n", "<C-p>", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes'))<cr>", opts)
-- TODO ctrl+f, ctrl+shift+f both work. WHY?
keymap("n", "<C-F>", "<cmd>lua require'telescope.builtin'.live_grep(require('telescope.themes'))<cr>", opts)
