local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    vim.notify("nvim-tree not found!")
    return
end

nvim_tree.setup({
    hijack_directories = {
        enable = false,
    },
    -- update_to_buf_dir = {
    --   enable = false,
    -- },
    -- disable_netrw = true,
    -- hijack_netrw = true,
    -- ignore_ft_on_setup = {
    --     "startify",
    --     "dashboard",
    --     "alpha",
    -- },
    filters = {
        custom = { "^.git$" },
    },
    -- auto_close = true,
    -- open_on_tab = false,
    -- hijack_cursor = false,
    update_cwd = true,
    -- update_to_buf_dir = {
    --   enable = true,
    --   auto_open = true,
    -- },
    -- --   error
    -- --   info
    -- --   question
    -- --   warning
    -- --   lightbulb
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
    -- system_open = {
    --   cmd = nil,
    --   args = {},
    -- },
    -- filters = {
    --   dotfiles = false,
    --   custom = {},
    -- },
    git = {
        enable = true,
        ignore = true,
        timeout = 500,
    },
    view = {
        adaptive_size = true,
        side = "left",
        -- auto_resize = true,
        number = false,
        relativenumber = false,
    },
})
