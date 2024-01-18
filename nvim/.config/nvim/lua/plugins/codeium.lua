return {
    {
        "Exafunction/codeium.vim",
        event = "InsertEnter",
        config = function()
            vim.api.nvim_set_keymap("i", "<Tab>", [[<cmd>lua vim.fn["codeium#Accept"]()<CR>]], { noremap = true })
            vim.api.nvim_set_keymap(
                "i",
                "<C-j>",
                [[<cmd>lua vim.fn["codeium#CycleCompletions"](1)<CR>]],
                { noremap = true }
            )
            vim.api.nvim_set_keymap(
                "i",
                "<C-k>",
                [[<cmd>lua vim.fn["codeium#CycleCompletions"](-1)<CR>]],
                { noremap = true }
            )
            vim.api.nvim_set_keymap("i", "<C-x>", [[<cmd>lua vim.fn["codeium#Clear"]()<CR>]], { noremap = true })
        end,
    },
}
