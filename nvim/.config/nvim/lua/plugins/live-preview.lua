return {
    "brianhuster/live-preview.nvim",
    ft = "markdown",
    dependencies = {
        "nvim-telescope/telescope.nvim",
    },
    keys = {
        {
            "<leader>mp",
            function()
                local filepath = vim.fn.expand("%:p")
                vim.cmd("LivePreview start " .. filepath)
            end,
            desc = "Markdown Preview",
        },
    },
}
