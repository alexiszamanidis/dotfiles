return {
    {
        "nvim-tree/nvim-web-devicons",
        -- event = "VeryLazy",
        config = function()
            require("nvim-web-devicons").setup({
                -- your personal icons can go here (to override)
                -- DevIcon will be appended to `name`
                override = {},
                -- globally enable default icons (default to false)
                -- will get overridden by `get_icons` option
                default = true,
            })
        end,
    },
}
