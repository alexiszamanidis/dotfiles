local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local mappings = {
  ["f"] = { "<cmd>lua require'telescope.builtin'.live_grep(require('telescope.themes'))<cr>", "Telescope live grep" },
  t = {
    name = "Tabs",
    v = { "<C-w>t<C-w>H", "Change to vertical split" },
    h = { "<C-w>t<C-w>K", "Change to horizontal split" },
  },
  p = {
    name = "Packer",
    r = { ":PackerClean<cr>", "Remove Unused Plugins" },
    c = { ":PackerCompile profile=true<cr>", "Recompile Plugins" },
    i = { ":PackerInstall<cr>", "Install Plugins" },
    p = { ":PackerProfile<cr>", "Packer Profile" },
    s = { ":PackerSync<cr>", "Sync Plugins" },
    S = { ":PackerStatus<cr>", "Packer Status" },
    u = { ":PackerUpdate<cr>", "Update Plugins" }
  }
}

local opts = { prefix = '<leader>' }
which_key.register(mappings, opts)
