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

-- Behave like the rest of the CAPITAL letters
keymap("n", "Y", "yg$", opts)

-- Keep same paste
keymap("v", "p", '"_dP', opts)

-- Keeping it centered
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
-- Move down UP and DOWN and center it
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- Do NOT lose your yank when you use
-- x
keymap("n", "x", '"_x', opts)
-- d
keymap("n", "d", '"_d', opts)
keymap("n", "D", '"_D', opts)
keymap("v", "d", '"_d', opts)
keymap("v", "D", '"_D', opts)

-- Replace word
keymap("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", opts)

-- Save
keymap("n", "<C-s>", ":w<cr>", opts)
keymap("v", "<C-s>", "<Esc>:w<cr>", opts)
keymap("i", "<C-s>", "<Esc>:w<cr>", opts)

-- Stay in indent mode
keymap("v", "<S-Tab>", "<gv", opts)
keymap("v", "<Tab>", ">gv", opts)

-- Move text up and down
-- Normal
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)
-- Visual
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-Down>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "<A-Up>", ":m .-2<CR>==", opts)
-- Visual Block
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-Down>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-Up>", ":move '<-2<CR>gv-gv", opts)

-- Splits
-- Move between splits
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
-- Move between splits
keymap("n", "<C-Left>", ":vertical resize +3<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -3<CR>", opts)
keymap("n", "<C-Up>", ":resize +3<CR>", opts)
keymap("n", "<C-Down>", ":resize -3<CR>", opts)

-- Tmux
keymap("n", "<C-f>", "<cmd>!tmux neww tmux-sessionizer<CR>", term_opts)

-- Telescope
keymap("n", "<C-p>", "<cmd>lua require'telescope.builtin'.git_files()<cr>", opts)

-- Nvim-tree
keymap("n", "<C-b>", ":NvimTreeToggle<cr>", opts)

-- Bufferline
-- keymap("n", "<C-i>", "<Cmd>BufferLineCycleNext<CR>", opts)
-- FIX: This keymap does not work
-- keymap("n", "<C-S-i>", "<Cmd>BufferLineCyclePrev<CR>", opts)
keymap("n", "<C-w>", "<Cmd>bdelete<CR>", opts)
keymap("n", "<A-1>", "<Cmd>BufferLineGoToBuffer 1<CR>", opts)
keymap("n", "<A-2>", "<Cmd>BufferLineGoToBuffer 2<CR>", opts)
keymap("n", "<A-3>", "<Cmd>BufferLineGoToBuffer 3<CR>", opts)
keymap("n", "<A-4>", "<Cmd>BufferLineGoToBuffer 4<CR>", opts)
keymap("n", "<A-5>", "<Cmd>BufferLineGoToBuffer 5<CR>", opts)
keymap("n", "<A-6>", "<Cmd>BufferLineGoToBuffer 6<CR>", opts)
keymap("n", "<A-7>", "<Cmd>BufferLineGoToBuffer 7<CR>", opts)
keymap("n", "<A-8>", "<Cmd>BufferLineGoToBuffer 8<CR>", opts)
keymap("n", "<A-9>", "<Cmd>BufferLineGoToBuffer 9<CR>", opts)

-- Comment with 'Ctrl-/'
keymap("n", "<C-_>", "<cmd>lua require('Comment.api').toggle.linewise()<cr>", opts)
keymap("i", "<C-_>", "<esc><cmd>lua require('Comment.api').toggle.linewise()<cr>", opts)
keymap("v", "<C-_>", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", opts)
