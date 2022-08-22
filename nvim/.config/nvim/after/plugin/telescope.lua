local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

telescope.load_extension('media_files')
-- local actions = require("telescope.actions")

telescope.setup {
    defaults = {
        prompt_prefix = " >",
        file_ignore_patterns = {
            ".git/",
            "node_modules/"
        }
    },
    pickers = {
        git_files = {
            show_untracked = true,
            hidden = true
        },
        live_grep = {
            additional_args = function()
                return { "--hidden" }
            end
        },
    }
}
