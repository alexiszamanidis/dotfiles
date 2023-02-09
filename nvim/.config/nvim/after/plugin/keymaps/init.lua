local Remap = require("user.keymaps")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap

local Utilities = require("user.utilities")
local existsDir = Utilities.existsDir

-- Increment/Decrement
nnoremap("+", "<C-a>")
nnoremap("-", "<C-x>")

-- Make file executable
nnoremap("<leader>x", "<cmd>!chmod +x %<CR>")

-- Behave like the rest of the CAPITAL letters
nnoremap("Y", "yg$")

-- Keep cursor at the beginning
nnoremap("J", "mzJ`z")

-- Quit
nnoremap("<C-q>", ":q<CR>")
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
-- c
nnoremap("c", '"_c')
nnoremap("C", '"_C')
vnoremap("c", '"_c')
vnoremap("C", '"_C')

-- Save
nnoremap("<C-s>", ":w<CR>")
vnoremap("<C-s>", "<Esc>:w<CR>")
inoremap("<C-s>", "<Esc>:w<CR>")

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
nnoremap("<C-p>", function()
    local tele_built = require("telescope.builtin")

    local pwd = vim.fn.getcwd()
    local current_git_dir = pwd .. "/.git"

    local ok, err = existsDir(current_git_dir)
    if ok then
        tele_built.git_files()
    else
        tele_built.find_files()
    end
end)

-- Nvim-tree
nnoremap("<C-b>", ":NvimTreeToggle<CR>")

-- Comment with 'Ctrl-/'
nnoremap("<C-_>", "<cmd>lua require('Comment.api').toggle.linewise()<CR>")
inoremap("<C-_>", "<esc><cmd>lua require('Comment.api').toggle.linewise()<CR>")
vnoremap("<C-_>", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")

-- Source file
nnoremap("<leader><leader>", function()
    vim.cmd("so")
end)
