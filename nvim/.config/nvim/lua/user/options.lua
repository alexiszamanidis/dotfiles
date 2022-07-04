local options = {
    exrc = true,
    hlsearch = false,
    hidden = true,
    errorbells = false,
    tabstop = 4,
    softtabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    smartindent = true,
    number = true,
    relativenumber = true,
    wrap = false,
    smartcase = true,
    swapfile = false,
    backup = false,
    undodir = "~/.vim/undodir",
    undofile = true,
    incsearch = true,
    scrolloff = 8,
    signcolumn = "yes",
    cursorcolumn = true,
    cursorline = true,
    ignorecase = true,
    splitbelow = true,
    splitright = true
}

vim.opt.shortmess:append "c"
-- Treesitter folding
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.wo.colorcolumn = "80"
