local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
    vim.notify("gitsings not found!")
    return
end

gitsigns.setup({})
