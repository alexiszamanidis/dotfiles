local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    group = highlight_group,
    callback = function()
        vim.hl.on_yank()
    end,
})
