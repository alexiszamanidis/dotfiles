local status_ok, icons = pcall(require, "nvim-web-devicons")
if not status_ok then
    vim.notify("nvim-web-devicons not found!")
    return
end

icons.setup({
    -- your personal icons can go here (to override)
    -- DevIcon will be appended to `name`
    override = {},
    -- globally enable default icons (default to false)
    -- will get overridden by `get_icons` option
    default = true,
})
