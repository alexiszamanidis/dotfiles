local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the packer.lua file
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost packer.lua source <afile> | PackerSync
    augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    vim.notify("packer not found!")
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

-- Install your plugins here
return packer.startup(function(use)
    -- My plugins here

    -- Have packer manage itself
    use({ "wbthomason/packer.nvim", commit = "ea0cc3c" })
    -- An implementation of the Popup API from vim in Neovim
    use({ "nvim-lua/popup.nvim", commit = "b7404d3" })
    -- Useful lua functions used by lots of plugins
    use({ "nvim-lua/plenary.nvim", commit = "55d9fe8" })
    use({ "windwp/nvim-ts-autotag", commit = "8515e48" })
    use({ "akinsho/bufferline.nvim", commit = "e48ce18" })
    use({ "nvim-lualine/lualine.nvim", commit = "2248ef2" })
    use({ "kyazdani42/nvim-tree.lua", commit = "50f30bc" })
    use({ "laytan/cloak.nvim", commit = "951b163" })

    -- UTILITIES
    use({ "lewis6991/impatient.nvim", commit = "47302af" })

    -- ICONS
    use({ "kyazdani42/nvim-web-devicons", commit = "a142590" })

    -- COMMENTS
    use({ "numToStr/Comment.nvim", commit = "0236521" })
    use({ "folke/todo-comments.nvim", commit = "4a6737a" })

    -- UI
    use({ "folke/which-key.nvim", commit = "4433e5e" })

    -- COLORSCHME
    use({ "Mofiqul/dracula.nvim", commit = "cadf9a1" })

    -- TabNine
    use({ "tzachar/cmp-tabnine", run = "./install.sh", commit = "b93f82e" })

    -- TELESCOPE
    use({ "nvim-telescope/telescope.nvim", commit = "f336f8c" })

    -- TREESITTER
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
        commit = "732c8cb",
    })
    -- sticky header
    use({ "nvim-treesitter/nvim-treesitter-context", commit = "c9f2b42" })

    -- GIT
    use({ "dinhhuy258/git.nvim", commit = "7416966" })
    use({ "lewis6991/gitsigns.nvim", commit = "d195f0c" })
    use({
        "sindrets/diffview.nvim",
        requires = "nvim-lua/plenary.nvim",
        commit = "3dc498c",
    })

    -- LSP
    use({
        "VonHeikemen/lsp-zero.nvim",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig",             commit = "a2e84dd" },
            { "williamboman/mason.nvim",           commit = "41e75af" },
            { "williamboman/mason-lspconfig.nvim", commit = "9453e3d" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp",                  commit = "538e37b" },
            { "hrsh7th/cmp-buffer",                commit = "3022dbc" },
            { "hrsh7th/cmp-path",                  commit = "91ff86c" },
            { "saadparwaiz1/cmp_luasnip",          commit = "05a9ab2" },
            { "hrsh7th/cmp-nvim-lsp",              commit = "5af77f5" },
            { "hrsh7th/cmp-nvim-lua",              commit = "f12408b" },

            -- Snippets
            { "L3MON4D3/LuaSnip",                  commit = "57c9f5c" },
            { "rafamadriz/friendly-snippets",      commit = "53d3df2" },
        },
        commit = "b904471",
    })

    -- formatters and linters
    use({ "jose-elias-alvarez/null-ls.nvim", commit = "0010ea9" })

    -- Java
    use({ "mfussenegger/nvim-jdtls", commit = "66b5ace" })

    -- DAP
    use({ "mfussenegger/nvim-dap", commit = "f0dca67" })
    use({ "rcarriga/nvim-dap-ui", commit = "34160a7" })
    use({ "ravenxrz/DAPInstall.nvim", commit = "8798b4c" })

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
