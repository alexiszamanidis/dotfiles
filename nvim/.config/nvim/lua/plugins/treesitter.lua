return {
    "nvim-treesitter/nvim-treesitter",
    -- main requires Neovim 0.12; master remains the 0.11 branch
    branch = "master",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "vimdoc",
                "javascript",
                "typescript",
                "lua",
                "jsdoc",
                "bash",
                "python",
            },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
