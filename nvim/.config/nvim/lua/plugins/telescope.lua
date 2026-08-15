return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        keys = {
            { "<C-p>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
            { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
            { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Find text in files" },
            { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
            { "<leader>ft", "<cmd>Telescope help_tags<cr>", desc = "Find tags" },
            { "<leader>fr", "<cmd>Telescope resume<cr>", desc = "Last search" },
            { "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "Find diagnostics" },
            {
                "<leader>fW",
                function()
                    require("telescope.builtin").grep_string({ search = vim.fn.expand("<cword>") })
                end,
                desc = "Find word",
            },
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
        end,
    },
}
