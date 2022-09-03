local status_ok, n_autotags = pcall(require, "nvim-ts-autotag")
if not status_ok then
    vim.notify("nvim-ts-autotag not found!")
    return
end

n_autotags.setup({})
