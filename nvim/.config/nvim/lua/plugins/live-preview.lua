return {
    "brianhuster/live-preview.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        local mappings = {
            {
                "<leader>mp",
                function()
                    local filepath = vim.fn.expand("%:p")
                    vim.cmd("LivePreview start " .. filepath)
                end,
                desc = "Markdown Preview",
            },
        }

        require("which-key").add(mappings)
    end,
}
