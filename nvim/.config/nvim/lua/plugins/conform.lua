return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")
        local format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback",
        }

        conform.setup({
            formatters_by_ft = {
                lua = { "stylua" },
                javascript = { "prettierd", "prettier", stop_after_first = true },
                typescript = { "prettierd", "prettier", stop_after_first = true },
                javascriptreact = { "prettierd", "prettier", stop_after_first = true },
                typescriptreact = { "prettierd", "prettier", stop_after_first = true },
                json = { "prettierd", "prettier", stop_after_first = true },
                markdown = { "prettierd", "prettier", stop_after_first = true },
                css = { "prettierd", "prettier", stop_after_first = true },
                scss = { "prettierd", "prettier", stop_after_first = true },
                java = { "google-java-format" },
                bash = { "beautysh" },
                python = { "black" },
            },
            -- format_on_save = function()
            --     if vim.g.disable_autoformat then
            --         return
            --     end
            --     return format_on_save
            -- end,
        })

        vim.keymap.set({ "n", "v" }, "<leader>l", function()
            conform.format({
                lsp_format = "fallback",
                async = false,
                timeout_ms = 1000,
            })
        end, { desc = "Format file or range (in visual mode)" })

        vim.keymap.set("n", "<leader>lF", function()
            vim.g.disable_autoformat = not vim.g.disable_autoformat
            vim.notify(vim.g.disable_autoformat and "Format on save off" or "Format on save on")
        end, { desc = "Toggle Autoformat" })
    end,
}
