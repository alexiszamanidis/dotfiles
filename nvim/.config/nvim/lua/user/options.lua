local options = {
    exrc = true,
    hlsearch = false, -- highlight all matches on previous search pattern
    hidden = true,
    errorbells = false,
    tabstop = 4, -- insert 2 spaces for a tab
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
    undodir = "~/.vim/undodir",
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
}

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.fillchars = vim.opt.fillchars + "eob: "

vim.opt.shortmess:append("c")

-- Treesitter folding
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd([[set iskeyword+=-]])
