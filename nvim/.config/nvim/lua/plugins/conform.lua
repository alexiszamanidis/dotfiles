return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                lua = { "stylua" },
                javascript = { { "prettierd", "prettier", stop_after_first = true } },
                typescript = { { "prettierd", "prettier", stop_after_first = true } },
                javascriptreact = { { "prettierd", "prettier", stop_after_first = true } },
                typescriptreact = { { "prettierd", "prettier", stop_after_first = true } },
                json = { { "prettierd", "prettier", stop_after_first = true } },
                markdown = { { "prettierd", "prettier", stop_after_first = true } },
                css = { { "prettierd", "prettier", stop_after_first = true } },
                scss = { { "prettierd", "prettier", stop_after_first = true } },
                java = { "google-java-format" },
                bash = { "beautysh" },
                python = { "black" },
            },
            format_on_save = {
                -- These options will be passed to conform.format()
                timeout_ms = 500,
                lsp_format = "fallback",
            },
        })

        vim.keymap.set({ "n", "v" }, "<leader>l", function()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            })
        end, { desc = "Format file or range (in visual mode)" })
    end,
}
