local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    vim.notify("nvim-treesitter.configs not found!")
    return
end

configs.setup({
    ensure_installed = "all",
    sync_install = false,
    autopairs = {
        enable = true,
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
    },
    indent = {
        enable = true,
    },
    autotag = {
        enable = true,
    },
})
