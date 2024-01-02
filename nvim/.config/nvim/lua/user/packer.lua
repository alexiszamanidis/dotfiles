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
    use({ "wbthomason/packer.nvim" })
    -- An implementation of the Popup API from vim in Neovim
    use({ "nvim-lua/popup.nvim" })
    -- Useful lua functions used ny lots of plugins
    use({ "nvim-lua/plenary.nvim" })
    use({ "windwp/nvim-ts-autotag" })
    use({ "akinsho/bufferline.nvim" })
    use({ "nvim-lualine/lualine.nvim" })
    use({ "kyazdani42/nvim-tree.lua" })
    use({ "laytan/cloak.nvim" })

    -- UTILITIES
    use({ "lewis6991/impatient.nvim" })

    -- ICONS
    use({ "kyazdani42/nvim-web-devicons" })

    -- COMMENTS
    use({ "numToStr/Comment.nvim" })
    use({ "folke/todo-comments.nvim" })

    -- UI
    use({ "folke/which-key.nvim" })

    -- COLORSCHME
    use({ "Mofiqul/dracula.nvim" })

    -- TabNine
    use({ "tzachar/cmp-tabnine", run = "./install.sh" })

    -- Telescope
    use({ "nvim-telescope/telescope.nvim" })

    -- Treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
    })
    -- Sticky header
    use({ "nvim-treesitter/nvim-treesitter-context" })


    -- Illuminate
    use({ "RRethy/vim-illuminate" })

    -- Git
    use({ "dinhhuy258/git.nvim" })
    use({ "lewis6991/gitsigns.nvim" })
    use({
        "sindrets/diffview.nvim",
        requires = "nvim-lua/plenary.nvim",
    })

    -- LSP
    use({
        "VonHeikemen/lsp-zero.nvim",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },

            -- Snippets
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
        },
    })

    -- Formatters and linters
    use({ "jose-elias-alvarez/null-ls.nvim" })

    -- Java
    use({ "mfussenegger/nvim-jdtls" })

    -- DAP
    use({ "mfussenegger/nvim-dap" })
    use({ "rcarriga/nvim-dap-ui" })
    use({ "ravenxrz/DAPInstall.nvim" })

    -- AI
    use({ "Exafunction/codeium.vim" })

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
