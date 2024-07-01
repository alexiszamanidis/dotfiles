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

cmp.setup({
    mapping = cmp_mappings,
})

require("fidget").setup({})
require("mason").setup({})
require("mason-null-ls").setup({
    ensure_installed = {
        "beautysh",
        "codespell",
        "eslint_d",
        "prettier",
        "google_java_format",
        "black",
    },
})
require("mason-lspconfig").setup({
    -- Replace the language servers listed here
    -- with the ones you want to install
    ensure_installed = {
        "cssls",
        "cssmodules_ls",
        "html",
        "jsonls",
        "tsserver",
        "eslint",
        "lua_ls",
        "yamlls",
        "bashls",
        "prismals",
        "jdtls",
        "pylsp",
    },
    handlers = {
        lsp.default_setup,
    },
})

-- Fix Undefined global 'vim'
lsp.nvim_lua_ls()

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = "E",
        warn = "W",
        hint = "H",
        info = "I",
    },
})

lsp.on_attach(require("user.lsp").on_attach)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})
