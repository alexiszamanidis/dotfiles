return {
    {
        "kyazdani42/nvim-tree.lua",
        event = "VeryLazy",
        config = function()
            require("nvim-tree").setup({
                hijack_directories = {
                    enable = false,
                },
                filters = {
                    custom = { "^.git$" },
                },
                update_cwd = true,
                renderer = {
                    add_trailing = false,
                    group_empty = false,
                    highlight_git = false,
                    highlight_opened_files = "none",
                    root_folder_modifier = ":t",
                    indent_markers = {
                        enable = false,
                        icons = {
                            corner = "└ ",
                            edge = "│ ",
                            none = "  ",
                        },
                    },
                    icons = {
                        webdev_colors = true,
                        git_placement = "before",
                        padding = " ",
                        symlink_arrow = " ➛ ",
                        show = {
                            file = true,
                            folder = true,
                            folder_arrow = true,
                            git = true,
                        },
                        glyphs = {
                            default = "",
                            symlink = "",
                            folder = {
                                default = "",
                                open = "",
                                empty = "",
                                empty_open = "",
                                symlink = "",
                                symlink_open = "",
                            },
                            git = {
                                unstaged = "",
                                staged = "S",
                                unmerged = "",
                                renamed = "➜",
                                untracked = "U",
                                deleted = "",
                                ignored = "◌",
                            },
                        },
                    },
                },
                diagnostics = {
                    enable = true,
                    icons = {
                        hint = "",
                        info = "",
                        warning = "",
                        error = "",
                    },
                },
                update_focused_file = {
                    enable = true,
                    update_cwd = true,
                    ignore_list = {},
                },
                git = {
                    enable = true,
                    ignore = true,
                    timeout = 500,
                },
                view = {
                    adaptive_size = true,
                    side = "left",
                    number = false,
                    relativenumber = false,
                },
            })

            vim.keymap.set("n", "<C-b>", ":NvimTreeToggle<CR>")
        end,
    },
}
