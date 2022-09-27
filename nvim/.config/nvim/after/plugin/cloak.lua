local status_ok, cloak = pcall(require, "cloak")
if not status_ok then
    vim.notify("Cloak not found!")
    return
end

cloak.setup({
    enabled = true,
    cloak_character = "*",
    highlight_group = "Comment",
    patterns = {
        {
            file_pattern = ".netrc",
            cloak_pattern = " .+",
        },
    },
})
