return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
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
        {
            "folke/lazydev.nvim",
            ft = "lua", -- only load on lua files
            opts = {
                library = {
                    -- See the configuration section for more details
                    -- Load luvit types when the `vim.uv` word is found
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                },
            },
        },
    },

    config = function()
        local cmp = require("cmp")
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )

        require("fidget").setup({})
        require("mason").setup()
        -- Install all Linters
        require("mason-nvim-lint").setup({
            ensure_installed = {
                "ansible_lint",
                "yamllint",
                "shellcheck",
            },
            ignore_install = {},
            automatic_installation = true,
            quiet_mode = false,
        })
        -- Install all Formatters
        require("mason-conform").setup()
        -- Install all LSP
        require("mason-lspconfig").setup({
            automatic_enable = true,
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
                "jdtls",
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities,
                    })
                end,
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

        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = true,
                header = "",
                prefix = "",
            },
        })

        local mappings = {
            {
                "<leader>la",
                "<cmd>lua vim.lsp.buf.code_action()<cr>",
                desc = "Code Action",
            },
            {
                "<leader>li",
                "<cmd>LspInfo<cr>",
                desc = "Info",
            },
            {
                "<leader>lf",
                "<cmd>lua vim.lsp.buf.format({ async = true })<cr>",
                desc = "Format",
            },
            {
                "<leader>lF",
                "<cmd>LspToggleAutoFormat<cr>",
                desc = "Toggle Autoformat",
            },
            {
                "<leader>lr",
                "<cmd>lua vim.lsp.buf.rename()<cr>",
                desc = "Rename",
            },
            {
                "<leader>lR",
                "<cmd>TroubleToggle lsp_references<cr>",
                desc = "References",
            },
        }

        require("which-key").add(mappings)
    end,
}
