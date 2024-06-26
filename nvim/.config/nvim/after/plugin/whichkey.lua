local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    vim.notify("which-key not found!")
    return
end

local mappings = {
    r = { ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", "Replace word" },
    g = {
        name = "Git",
        d = { ":DiffviewOpen<cr>", "Diff" },
        ["dc"] = { ":DiffviewClose<cr>", "Diff Close" },
        -- d = {
        --     "<cmd>Gitsigns diffthis HEAD<cr>",
        --     "Diff",
        -- },
    },
    f = {
        name = "Find",
        f = { "<cmd>Telescope find_files<cr>", "Find files" },
        g = { "<cmd>Telescope live_grep<cr>", "Find text in files" },
        b = { "<cmd>Telescope buffers<cr>", "Find buffers" },
        t = { "<cmd>Telescope help_tags<cr>", "Find tags" },
        r = { "<cmd>Telescope resume<cr>", "Last search" },
        d = { "<cmd>Telescope diagnostics<cr>", "Find diagnostics" },
    },
    l = {
        name = "LSP",
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
        i = { "<cmd>LspInfo<cr>", "Info" },
        f = { "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "Format" },
        F = { "<cmd>LspToggleAutoFormat<cr>", "Toggle Autoformat" },
        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
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
        u = { ":PackerUpdate<cr>", "Update Plugins" },
    },
    d = {
        name = "Debug",
        b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Breakpoint" },
        c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
        i = { "<cmd>lua require'dap'.step_into()<cr>", "Into" },
        o = { "<cmd>lua require'dap'.step_over()<cr>", "Over" },
        O = { "<cmd>lua require'dap'.step_out()<cr>", "Out" },
        r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Repl" },
        l = { "<cmd>lua require'dap'.run_last()<cr>", "Last" },
        u = { "<cmd>lua require'dapui'.toggle()<cr>", "UI" },
        x = { "<cmd>lua require'dap'.terminate()<cr>", "Exit" },
    },
    t = {
        name = "Trouble",
        x = { "<cmd>Trouble diagnostics toggle focus filter.buf=0<cr>", "Toggle" },
        w = { "<cmd>Trouble diagnostics toggle focus<cr>", "Workspace Diagnostics" },
        d = { "<cmd>Trouble diagnostics toggle focus filter.buf=0<cr>", "Toggle" },
        q = { "<cmd>Trouble qflist toggle<cr>", "Quickfix" },
        l = { "<cmd>Trouble loclist toggle<cr>", "Loclist" },
    },
    b = {
        name = "Background",
        i = {
            function()
                require("user.telescope").background_image_selector()
            end,
            "Background images",
        },
    },
}

local opts = { prefix = "<leader>" }
which_key.register(mappings, opts)
