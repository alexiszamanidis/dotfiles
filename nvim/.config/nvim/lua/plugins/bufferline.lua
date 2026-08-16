return {
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("bufferline").setup({
                options = {
                    numbers = "none",
                    indicator = {
                        icon = "│",
                        style = "icon",
                    },
                    buffer_close_icon = "",
                    modified_icon = "●",
                    close_icon = "",
                    left_trunc_marker = "",
                    right_trunc_marker = "",
                    max_name_length = 30,
                    max_prefix_length = 30,
                    tab_size = 21,
                    diagnostics = false,
                    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
                    show_buffer_icons = true,
                    show_buffer_close_icons = true,
                    show_close_icon = true,
                    show_tab_indicators = true,
                    persist_buffer_sort = true,
                    separator_style = "thin",
                    enforce_regular_tabs = true,
                    always_show_bufferline = true,
                },
                highlights = {
                    background = {
                        fg = { attribute = "fg", highlight = "TabLine" },
                        bg = { attribute = "bg", highlight = "TabLine" },
                    },
                    buffer_visible = {
                        fg = { attribute = "fg", highlight = "TabLine" },
                        bg = { attribute = "bg", highlight = "TabLine" },
                    },
                    close_button = {
                        fg = { attribute = "fg", highlight = "TabLine" },
                        bg = { attribute = "bg", highlight = "TabLine" },
                    },
                    close_button_visible = {
                        fg = { attribute = "fg", highlight = "TabLine" },
                        bg = { attribute = "bg", highlight = "TabLine" },
                    },
                    tab_selected = {
                        fg = { attribute = "fg", highlight = "Normal" },
                        bg = { attribute = "bg", highlight = "Normal" },
                    },
                    tab = {
                        fg = { attribute = "fg", highlight = "TabLine" },
                        bg = { attribute = "bg", highlight = "TabLine" },
                    },
                    tab_close = {
                        fg = { attribute = "fg", highlight = "TabLineSel" },
                        bg = { attribute = "bg", highlight = "Normal" },
                    },
                    modified = {
                        fg = { attribute = "fg", highlight = "TabLine" },
                        bg = { attribute = "bg", highlight = "TabLine" },
                    },
                    modified_selected = {
                        fg = { attribute = "fg", highlight = "Normal" },
                        bg = { attribute = "bg", highlight = "Normal" },
                    },
                    modified_visible = {
                        fg = { attribute = "fg", highlight = "TabLine" },
                        bg = { attribute = "bg", highlight = "TabLine" },
                    },
                    separator = {
                        fg = { attribute = "bg", highlight = "TabLine" },
                        bg = { attribute = "bg", highlight = "TabLine" },
                    },
                    separator_selected = {
                        fg = { attribute = "bg", highlight = "Normal" },
                        bg = { attribute = "bg", highlight = "Normal" },
                    },
                    indicator_selected = {
                        fg = { attribute = "fg", highlight = "DiagnosticHint" },
                        bg = { attribute = "bg", highlight = "Normal" },
                    },
                },
            })

            vim.keymap.set("n", "<C-w>", "<Cmd>bdelete<CR>")
            for i = 1, 9 do
                vim.keymap.set("n", "<A-" .. i .. ">", "<Cmd>BufferLineGoToBuffer " .. i .. "<CR>")
            end
        end,
    },
}
