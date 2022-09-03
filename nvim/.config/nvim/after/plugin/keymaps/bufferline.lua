local Remap = require("user.keymaps")
local nnoremap = Remap.nnoremap

-- nnoremap("<C-i>", "<Cmd>BufferLineCycleNext<CR>")
-- TODO: This keymap does not work(Should fix this)
-- nnoremap("<C-S-i>", "<Cmd>BufferLineCyclePrev<CR>")
nnoremap("<C-w>", "<Cmd>bdelete<CR>")
nnoremap("<A-1>", "<Cmd>BufferLineGoToBuffer 1<CR>")
nnoremap("<A-2>", "<Cmd>BufferLineGoToBuffer 2<CR>")
nnoremap("<A-3>", "<Cmd>BufferLineGoToBuffer 3<CR>")
nnoremap("<A-4>", "<Cmd>BufferLineGoToBuffer 4<CR>")
nnoremap("<A-5>", "<Cmd>BufferLineGoToBuffer 5<CR>")
nnoremap("<A-6>", "<Cmd>BufferLineGoToBuffer 6<CR>")
nnoremap("<A-7>", "<Cmd>BufferLineGoToBuffer 7<CR>")
nnoremap("<A-8>", "<Cmd>BufferLineGoToBuffer 8<CR>")
nnoremap("<A-9>", "<Cmd>BufferLineGoToBuffer 9<CR>")