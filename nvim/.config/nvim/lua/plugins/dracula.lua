return {
    { "Mofiqul/dracula.nvim" },
    {
        "LazyVim/LazyVim",
        dependencies = {
            { "folke/snacks.nvim", lazy = false },
        },
        opts = {
            colorscheme = "dracula",
        },
    },
}
