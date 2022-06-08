local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

vim.opt.termguicolors = true

require("bufferline").setup{}

vim.cmd [[
nnoremap <silent><ALT-TAB> :BufferLineCycleNext<CR>
nnoremap <silent><ALT-SHIFT-TAB> :BufferLineCyclePrev<CR>
nnoremap <silent><ALT-w> :BufferLineGroupClose<CR>
]]
