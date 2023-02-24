local lsp_status_ok, lsp = pcall(require, "lsp-zero")
if not lsp_status_ok then
    vim.notify("lsp-zero not found!")
    return
end

lsp.preset("recommended")

local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    vim.notify("cmp not found!")
    return
end
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})
-- disable completion with tab
-- this helps with copilot setup
-- cmp_mappings["<Tab>"] = nil
-- cmp_mappings["<S-Tab>"] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings,
})

lsp.ensure_installed({
    "cssls",
    "cssmodules_ls",
    "html",
    "jsonls",
    "tsserver",
    "yamlls",
    "bashls",
    "prismals",
    "jdtls",
})

-- Fix Undefined global 'vim'
lsp.configure('lua-language-server', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = "E",
        warn = "W",
        hint = "H",
        info = "I",
    },
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    local keymap = vim.keymap
    local buf = vim.lsp.buf
    local diagnostic = vim.diagnostic

    keymap.set("n", "gd", buf.definition, opts)
    keymap.set("n", "gD", buf.declaration, opts)
    keymap.set("n", "gi", buf.implementation, opts)
    keymap.set("n", "K", buf.hover, opts)
    keymap.set("n", "gl", diagnostic.open_float, opts)
    keymap.set("n", "[d", diagnostic.goto_prev, opts)
    keymap.set("n", "]d", diagnostic.goto_next, opts)
    keymap.set("n", "<M-a>", buf.code_action, opts)
    keymap.set("n", "gr", buf.references, opts)
    keymap.set("n", "gR", buf.rename, opts)
    keymap.set("i", "gs", buf.signature_help, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})
