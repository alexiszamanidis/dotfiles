local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end

local mappings = {
    f = {
        name = "Find",
        f = { "<cmd>Telescope git_files<cr>", "Find files" },
        g = { "<cmd>Telescope live_grep<cr>", "Find text in files" },
        b = { "<cmd>Telescope buffers<cr>", "Find buffers" },
        t = { "<cmd>Telescope help_tags<cr>", "Find tags" },
        r = { "<cmd>Telescope resume<cr>", "Last search" },
        d = { "<cmd>Telescope diagnostics<cr>", "Find diagnostics" }
    },
    l = {
        name = "LSP",
        i = { "<cmd>LspInfo<cr>", "Info" },
        f = { "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "Format" },
        F = { "<cmd>LspToggleAutoFormat<cr>", "Toggle Autoformat" },
        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
        R = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
    },
    s = {
        name = "Tabs",
        l = { ":vsp<cr>", "Split vertically" },
        j = { ":sp<cr>", "Split horizontally" },
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
