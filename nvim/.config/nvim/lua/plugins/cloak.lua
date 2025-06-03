return {
    {
        "laytan/cloak.nvim",
        config = function()
            require("cloak").setup({
                enabled = true,
                cloak_character = "*",
                highlight_group = "Comment",
                patterns = {
                    {
                        file_pattern = ".netrc",
                        cloak_pattern = " .+",
                    },
                    {
                        file_pattern = ".pipeline",
                        cloak_pattern = ":.+",
                    },
                },
            })
        end,
    },
}
