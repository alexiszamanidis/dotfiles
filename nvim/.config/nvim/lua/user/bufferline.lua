local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

vim.opt.termguicolors = true

require("bufferline").setup{}

vim.cmd [[
nnoremap <silent><ALT-TAB> :BufferLineCycleNext<CR>
nnoremap <silent><ALT-SHIFT-TAB> :BufferLineCyclePrev<CR>
nnoremap <silent><SHIFT-w> :BufferLineGroupClose<CR>
nnoremap <silent><ALT-1> <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent><ALT-2> <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent><ALT-3> <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent><ALT-4> <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent><ALT-5> <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent><ALT-6> <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent><ALT-7> <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent><ALT-8> <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent><ALT-9> <Cmd>BufferLineGoToBuffer 9<CR>
]]
