return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        config = function()
            require("telescope").setup({
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
                        preview_cutoff = 120,
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

            local builtin = require("telescope.builtin")

            local mappings = {
                -- Find mappings
                {
                    "<C-p>",
                    builtin.find_files,
                    desc = "Find files",
                },
                {
                    "<leader>ff",
                    builtin.find_files,
                    desc = "Find files",
                },
                {
                    "<leader>fg",
                    builtin.live_grep,
                    desc = "Find text in files",
                },
                {
                    "<leader>fb",
                    builtin.buffers,
                    desc = "Find buffers",
                },
                {
                    "<leader>ft",
                    builtin.help_tags,
                    desc = "Find tags",
                },
                {
                    "<leader>fr",
                    builtin.resume,
                    desc = "Last search",
                },
                {
                    "<leader>fd",
                    builtin.diagnostics,
                    desc = "Find diagnostics",
                },
                {
                    "<leader>fW",
                    function()
                        local word = vim.fn.expand("<cword>")
                        builtin.grep_string({ search = word })
                    end,
                    desc = "Find word",
                },
            }

            require("which-key").add(mappings)
        end,
    },
}
