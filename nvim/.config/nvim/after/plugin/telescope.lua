local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    vim.notify("telescope not found!")
    return
end

telescope.setup({
    defaults = {
        prompt_prefix = " > ",
        file_ignore_patterns = {
            ".git/",
            "node_modules/",
        },
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = { prompt_position = "top", preview_width = 0.55, results_width = 0.8 },
            vertical = { mirror = false },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120
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
