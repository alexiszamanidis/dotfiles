local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    vim.notify("telescope not found!")
    return
end

telescope.setup({
    defaults = {
        prompt_prefix = " >",
        file_ignore_patterns = {
            ".git/",
            "node_modules/",
        },
    },
    pickers = {
        find_files = {
            show_untracked = true,
            hidden = true,
        },
        git_files = {
            show_untracked = true,
            hidden = true,
        },
        live_grep = {
            additional_args = function()
                return { "--hidden" }
            end,
        },
    },
})
