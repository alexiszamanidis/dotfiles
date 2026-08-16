return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "mason-org/mason.nvim",
        "mason-org/mason-lspconfig.nvim",
        "rshkarin/mason-nvim-lint",
        "zapling/mason-conform.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
        "folke/which-key.nvim",
        {
            "folke/lazydev.nvim",
            ft = "lua",
            opts = {
                library = {
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                },
            },
        },
    },

    config = function()
        local cmp = require("cmp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            vim.lsp.protocol.make_client_capabilities(),
            require("cmp_nvim_lsp").default_capabilities()
        )

        vim.lsp.config("*", { capabilities = capabilities })

        require("fidget").setup({})
        require("mason").setup()
        require("mason-nvim-lint").setup({
            -- nvim-lint names (mapped to Mason packages internally)
            ensure_installed = {
                "ansible_lint",
                "yamllint",
                "shellcheck",
                "eslint_d",
                "codespell",
            },
            ignore_install = {},
            automatic_installation = true,
            quiet_mode = false,
        })
        require("mason-conform").setup()
        require("mason-lspconfig").setup({
            automatic_enable = {
                exclude = { "jdtls" },
            },
            ensure_installed = {
                "cssls",
                "cssmodules_ls",
                "html",
                "jsonls",
                "ts_ls",
                "lua_ls",
                "yamlls",
                "bashls",
                "prismals",
            },
        })

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = {
                { name = "codeium" },
                { name = "nvim_lsp" },
                { name = "luasnip", keyword_length = 2 },
                { name = "buffer", keyword_length = 3 },
                { name = "path" },
            },
        })

        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
            },
        })

        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                { name = "cmdline" },
            }),
        })

        vim.diagnostic.config({
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = true,
                header = "",
                prefix = "",
            },
        })

        require("which-key").add({
            { "<leader>la", vim.lsp.buf.code_action, desc = "Code Action" },
            { "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
            {
                "<leader>lf",
                function()
                    vim.lsp.buf.format({ async = true })
                end,
                desc = "Format",
            },
            { "<leader>lr", vim.lsp.buf.rename, desc = "Rename" },
            { "<leader>lR", "<cmd>Trouble lsp_references toggle<cr>", desc = "References" },
        })
    end,
}
