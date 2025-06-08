return {
    {
        "dinhhuy258/git.nvim",
        config = function()
            require("git").setup({})
        end,
    },
    {
        "sindrets/diffview.nvim",
        event = "VeryLazy",
        config = function()
            require("diffview").setup({})

            local mappings = {
                {
                    "<leader>gd",
                    ":DiffviewOpen<cr>",
                    desc = "Diff",
                },
                {
                    "<leader>gdc",
                    ":DiffviewClose<cr>",
                    desc = "Diff Close",
                },
            }

            require("which-key").add(mappings)
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = function()
            require("gitsigns").setup({})
        end,
    },
}
