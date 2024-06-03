return {
    {
        "nvimtools/none-ls.nvim",
        dependencies = {
            "nvimtools/none-ls-extras.nvim",
        },
        config = function()
            local null_ls = require("null-ls")
            local formatting = null_ls.builtins.formatting
            local diagnostics = null_ls.builtins.diagnostics
            local code_actions = null_ls.builtins.code_actions

            local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

            null_ls.setup({
                debug = false,
                sources = {
                    formatting.stylua, -- Lua
                    require("none-ls.formatting.beautysh"), -- Bash, Zsh
                    diagnostics.codespell, -- Codespell
                    require("none-ls.diagnostics.eslint"), -- JavaScript etc
                    require("none-ls.code_actions.eslint"), -- JavaScript etc
                    formatting.prettier, -- javascript etc
                    formatting.google_java_format, -- java
                },
                -- you can reuse a shared lspconfig on_attach callback here
                on_attach = function(client, bufnr)
                    if client.supports_method("textDocument/formatting") then
                        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = augroup,
                            buffer = bufnr,
                            callback = function()
                                vim.lsp.buf.format({ bufnr = bufnr })
                            end,
                        })
                    end
                end,
            })
        end,
    },
}
