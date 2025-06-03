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
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = function()
            require("gitsigns").setup({})
        end,
    },
}
