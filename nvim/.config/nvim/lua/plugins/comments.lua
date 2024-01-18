return {
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup({})

            -- Comment with 'Ctrl-/'
            vim.api.nvim_set_keymap('n', '<C-_>', '<cmd>lua require("Comment.api").toggle.linewise()<CR>', { noremap = true })
            vim.api.nvim_set_keymap('i', '<C-_>', '<esc><cmd>lua require("Comment.api").toggle.linewise()<CR>', { noremap = true })
            vim.api.nvim_set_keymap('v', '<C-_>', '<esc><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', { noremap = true })

        end,
    },
}



