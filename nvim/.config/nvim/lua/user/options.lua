local options = {
    exrc = true,
    hlsearch = true,                         -- highlight all matches on previous search pattern
    hidden = true,
    errorbells = false,
    tabstop = 4,                             -- insert 2 spaces for a tab
    softtabstop = 4,
    shiftwidth = 4,                          -- the number of spaces inserted for each indentation
    expandtab = true,                        -- convert tabs to spaces
    number = true,                           -- set numbered lines
    relativenumber = true,
    wrap = false,                            -- display lines as one long line
    smartcase = true,                        -- smart case
    smartindent = true,                      -- make indenting smarter again
    swapfile = false,                        -- creates a swapfile
    backup = false,                          -- creates a backup file
    clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
    undodir = "~/.vim/undodir",
    undofile = true,                         -- enable persistent undo
    incsearch = true,
    scrolloff = 8,                           -- is one of my fav
    signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
    cursorcolumn = true,
    cursorline = true,                       -- highlight the current line
    ignorecase = true                        -- ignore case in search patterns
}

vim.opt.shortmess:append "c"
-- Treesitter folding
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.wo.colorcolumn = "80"
