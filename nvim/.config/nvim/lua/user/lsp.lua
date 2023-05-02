local M = {}

M.on_attach = function(client, bufnr)
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

    if client.name == "jdt.ls" then
        vim.lsp.codelens.refresh()
        if JAVA_DAP_ACTIVE then
            require("jdtls").setup_dap({ hotcodereplace = "auto" })
            require("jdtls.dap").setup_dap_main_class_configs()
        end
    end
end

return M
