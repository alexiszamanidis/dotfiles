local Remap = require("user.keymaps")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap

-- Behave like the rest of the CAPITAL letters
nnoremap("Y", "yg$")

-- Quit
nnoremap("<C-q>", ":q<cr>")
inoremap("<C-c>", "<Esc>")

-- Keep same paste
vnoremap("p", '"_dP')

-- Keeping it centered
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")
-- Move down UP and DOWN and center it
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

-- Do NOT lose your yank when you use
-- x
nnoremap("x", '"_x')
-- d
nnoremap("d", '"_d')
nnoremap("D", '"_D')
vnoremap("d", '"_d')
vnoremap("D", '"_D')

-- Save
nnoremap("<C-s>", ":w<cr>")
vnoremap("<C-s>", "<Esc>:w<cr>")
inoremap("<C-s>", "<Esc>:w<cr>")

-- Stay in indent mode
vnoremap("<S-Tab>", "<gv")
vnoremap("<Tab>", ">gv")

-- Move text up and down
-- Normal
nnoremap("<A-j>", ":m .+1<CR>==")
nnoremap("<A-k>", ":m .-2<CR>==")
-- Visual
vnoremap("<A-j>", ":m .+1<CR>==")
vnoremap("<A-Down>", ":m .+1<CR>==")
vnoremap("<A-k>", ":m .-2<CR>==")
vnoremap("<A-Up>", ":m .-2<CR>==")
-- Visual Block
xnoremap("J", ":move '>+1<CR>gv-gv")
xnoremap("K", ":move '<-2<CR>gv-gv")
xnoremap("<A-j>", ":move '>+1<CR>gv-gv")
xnoremap("<A-Down>", ":move '>+1<CR>gv-gv")
xnoremap("<A-k>", ":move '<-2<CR>gv-gv")
xnoremap("<A-Up>", ":move '<-2<CR>gv-gv")

-- Move between splits
-- Vim
nnoremap("<C-h>", "<C-w>h")
nnoremap("<C-j>", "<C-w>j")
nnoremap("<C-k>", "<C-w>k")
nnoremap("<C-l>", "<C-w>l")
-- Arrows
nnoremap("<C-Left>", ":vertical resize +3<CR>")
nnoremap("<C-Right>", ":vertical resize -3<CR>")
nnoremap("<C-Up>", ":resize +3<CR>")
nnoremap("<C-Down>", ":resize -3<CR>")

-- Tmux
nnoremap("<C-f>", "<cmd>!tmux neww tmux-sessionizer<CR>")

-- Telescope
nnoremap("<C-p>", "<cmd>lua require'telescope.builtin'.git_files()<cr>")

-- Nvim-tree
nnoremap("<C-b>", ":NvimTreeToggle<cr>")

-- Comment with 'Ctrl-/'
nnoremap("<C-_>", "<cmd>lua require('Comment.api').toggle.linewise()<cr>")
inoremap("<C-_>", "<esc><cmd>lua require('Comment.api').toggle.linewise()<cr>")
vnoremap("<C-_>", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>")
