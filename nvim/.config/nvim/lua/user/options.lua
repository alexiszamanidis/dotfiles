local home = os.getenv("HOME")

local options = {
    exrc = true,
    hlsearch = false, -- highlight all matches on previous search pattern
    hidden = true,
    errorbells = false,
    tabstop = 4, -- insert 4 spaces for a tab
    softtabstop = 4,
    shiftwidth = 4, -- the number of spaces inserted for each indentation
    expandtab = true, -- convert tabs to spaces
    number = true, -- set numbered lines
    relativenumber = true, -- set relative numbered lines
    wrap = false, -- display lines as one long line
    smartcase = true, -- smart case
    smartindent = true, -- make indenting smarter again
    swapfile = false, -- creates a swapfile
    backup = false, -- creates a backup file
    clipboard = "unnamedplus", -- allows neovim to access the system clipboard
    undodir = vim.fn.expand("~/.vim/undodir"),
    undofile = true, -- enable persistent undo
    incsearch = true,
    scrolloff = 8, -- determine the number of context lines you would like to see above and below the cursor
    signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
    cursorcolumn = true,
    cursorline = true, -- highlight the current line
    ignorecase = true, -- ignore case in search patterns
    splitbelow = true, -- force all horizontal splits to go below current window
    splitright = true, -- force all vertical splits to go to the right of current window
    colorcolumn = "80",
    updatetime = 50, -- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- Leader
vim.g.mapleader = " "

-- Turns off netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_netrwFileHandlers = 1

-- Fillchars(eob: end of buffer)
vim.opt.fillchars = vim.opt.fillchars + "eob: "

-- Shorter messages
vim.opt.shortmess:append("c")
