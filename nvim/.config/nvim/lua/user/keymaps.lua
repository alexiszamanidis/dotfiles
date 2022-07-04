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

-- Visual --
-- Keep same paste
keymap("v", "p", '"_dP', opts)
-- Stay in indent mode
keymap("v", "<S-Tab>", "<gv", opts)
keymap("v", "<Tab>", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-Down>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "<A-Up>", ":m .-2<CR>==", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-Down>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-Up>", ":move '<-2<CR>gv-gv", opts)

-- Telescope
keymap("n", "<C-p>", "<cmd>lua require'telescope.builtin'.git_files(require('telescope.themes'))<cr>", opts)
-- TODO: need to replace this with C-S-f. It is not working cuz of KITTY!?!
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.live_grep(require('telescope.themes'))<cr>", opts)

-- Nvim-tree
keymap("n", "<C-b>", ":NvimTreeToggle<cr>", opts)

-- Bufferline
keymap("n", "<C-i>", "<Cmd>BufferLineCycleNext<CR>", opts)
-- This keymap does not work
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
-- Split windows
keymap("n", "<C-\\>", ":vsp<cr>", opts)
-- TODO: HOW CAN I MAKE THIS WORK?
keymap("n", "<C-minus>", ":sp<cr>", opts)
-- Change 2 split windows from vert to horiz or horiz to vert
keymap("n", "<Leader>tv", "<C-w>t<C-w>H", opts)
keymap("n", "<Leader>th", "<C-w>t<C-w>K", opts)

-- Tmux
keymap("n", "<C-f>", "<cmd>!tmux neww tmux-sessionizer<CR>", term_opts)
