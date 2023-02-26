require("user.options")
require("user.keymaps")
require("user.colorscheme")
require("user.packer")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local yank_group = augroup("HighlightYank", {})
autocmd("TextYankPost", {
    group = yank_group,
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 40,
        })
    end,
})

-- local open_telescope_find_files = augroup("FindFilesOnStartUp", {})
-- autocmd("VimEnter", {
--     group = open_telescope_find_files,
--     pattern = "*",
--     callback = function()
--         vim.cmd("lua require('user.telescope').find_files()")
--     end,
-- })
