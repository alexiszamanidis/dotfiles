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

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
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
    use({ "kyazdani42/nvim-tree.lua" })
    use({ "laytan/cloak.nvim" })

    -- TERMINAL
    use({ "akinsho/toggleterm.nvim" })

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

    -- COMPLETIONS
    -- completion plugin
    use({ "hrsh7th/nvim-cmp" })
    -- buffer completions
    use({ "hrsh7th/cmp-buffer" })
    -- path completions
    use({ "hrsh7th/cmp-path" })
    -- cmdline completions
    use({ "hrsh7th/cmp-cmdline" })
    -- snippet completions
    use({ "saadparwaiz1/cmp_luasnip" })
    -- Completion
    use({ "hrsh7th/cmp-nvim-lsp" })
    -- TabNine
    use({ "tzachar/cmp-tabnine", run = "./install.sh" })

    -- SNIPPETS
    --snippet engine
    use({ "L3MON4D3/LuaSnip" })

    -- TELESCOPE
    use({ "nvim-telescope/telescope.nvim" })

    -- TREESITTER
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    })
    -- sticky header
    use({ "nvim-treesitter/nvim-treesitter-context" })

    -- GIT
    use({ "dinhhuy258/git.nvim" })
    use({ "lewis6991/gitsigns.nvim" })
    use({
        "sindrets/diffview.nvim",
        requires = "nvim-lua/plenary.nvim",
    })

    -- LSP
    -- enable LSP
    use({ "neovim/nvim-lspconfig" })
    use({ "williamboman/mason.nvim" })
    use({ "williamboman/mason-lspconfig.nvim" })
    -- language server settings defined in json for
    use({ "tamago324/nlsp-settings.nvim" })
    use({ "b0o/SchemaStore.nvim" })
    -- for formatters and linters
    use({ "jose-elias-alvarez/null-ls.nvim" })
    use({ "ray-x/lsp_signature.nvim" })
    -- vscode-like pictograms
    use({ "onsails/lspkind-nvim" })

    -- Java
    use({ "mfussenegger/nvim-jdtls" })

    -- DAP
    use({ "mfussenegger/nvim-dap" })
    use({ "rcarriga/nvim-dap-ui" })
    use({ "ravenxrz/DAPInstall.nvim" })

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
