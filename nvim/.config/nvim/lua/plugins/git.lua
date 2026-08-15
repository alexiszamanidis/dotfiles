return {
    {
        "dinhhuy258/git.nvim",
        event = "VeryLazy",
        config = function()
            require("git").setup({})
        end,
    },
    {
        "sindrets/diffview.nvim",
        cmd = { "DiffviewOpen", "DiffviewClose" },
        keys = {
            { "<leader>gd", ":DiffviewOpen<cr>", desc = "Diff" },
            { "<leader>gdc", ":DiffviewClose<cr>", desc = "Diff Close" },
        },
        config = function()
            require("diffview").setup({})
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("gitsigns").setup({})
        end,
    },
}
