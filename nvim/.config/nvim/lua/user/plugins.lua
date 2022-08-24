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
    use({ "wbthomason/packer.nvim", commit = "3a9f9801f683946b9f1047d8f4bf9946c29e927d" })
    -- An implementation of the Popup API from vim in Neovim
    use({ "nvim-lua/popup.nvim", commit = "b7404d35d5d3548a82149238289fa71f7f6de4ac" })
    -- Useful lua functions used ny lots of plugins
    use({ "nvim-lua/plenary.nvim", commit = "31807eef4ed574854b8a53ae40ea3292033a78ea" })
    -- Autopairs, integrates with both cmp and treesitter
    use({ "windwp/nvim-autopairs", commit = "0a18e10a0c3fde190437567e40557dcdbbc89ea1" })
    use({ "windwp/nvim-ts-autotag", commit = "fdefe46c6807441460f11f11a167a2baf8e4534b" })
    use({ "akinsho/bufferline.nvim", commit = "5a755ea88752af31684f5ac88074c2ae12964a6d" })
    use({ "kyazdani42/nvim-tree.lua", commit = "e3353c4cb40baef335e1a21d8b9c21b9cde919be" })

    -- TERMINAL
    use({ "akinsho/toggleterm.nvim", commit = "62683d927dfd30dc68441a5811fdcb6c9f176c42" })

    -- UTILITIES
    use({ "lewis6991/impatient.nvim", commit = "b842e16ecc1a700f62adb9802f8355b99b52a5a6" }) -- Speed up loading Lua modules in Noevim to improve startup time

    -- ICONS
    use({ "kyazdani42/nvim-web-devicons", commit = "2d02a56189e2bde11edd4712fea16f08a6656944" })

    -- COMMENTS
    use({ "numToStr/Comment.nvim", commit = "ba5903b88c0a43fdc94abe79ade2b8291ff661ed" })
    use({ "B4mbus/todo-comments.nvim", commit = "6347cc3f69b938ca18f4101ab991d89b3c369023" })

    -- UI
    use({ "folke/which-key.nvim", commit = "bd4411a2ed4dd8bb69c125e339d837028a6eea71" })

    -- COLORSCHME
    use({ "Mofiqul/dracula.nvim", commit = "40d38e95bf006470b3efe837b2e0b9f66707c850" })

    -- COMPLETIONS
    -- completion plugin
    use({ "hrsh7th/nvim-cmp", commit = "828768631bf224a1a63771aefd09c1a072b6fe84" })
    -- buffer completions
    use({ "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" })
    -- path completions
    use({ "hrsh7th/cmp-path", commit = "" })
    -- cmdline completions
    use({ "hrsh7th/cmp-cmdline", commit = "9c0e331fe78cab7ede1c051c065ee2fc3cf9432e" })
    -- snippet completions
    use({ "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" })
    -- Completion
    use({ "hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" })

    -- SNIPPETS
    --snippet engine
    use({ "L3MON4D3/LuaSnip", commit = "04f90900f2a57938921fd25169c7f282e7eefe85" })

    -- TELESCOPE
    use({ "nvim-telescope/telescope.nvim", commit = "28dc08f614f45d37ad90f170935f1f4e12559aeb" })

    -- TREESITTER
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        commit = "4b536a9709fa4cbbc4c9ae8b32e7a32821a7249e",
    })

    -- GIT
    use({ "dinhhuy258/git.nvim", commit = "68582afbc6a16366f6c08448c23d0315b5bc1573" })
    use({ "lewis6991/gitsigns.nvim", commit = "1e107c91c0c5e3ae72c37df8ffdd50f87fb3ebfa" })

    -- LSP
    -- enable LSP
    use({ "neovim/nvim-lspconfig", commit = "70af1bf414d7f9926fc883a008246db8a544f69c" })
    use({ "williamboman/mason.nvim", commit = "03a326ad32eaa227f290cad3eb562d33467af4e6" })
    use({ "williamboman/mason-lspconfig.nvim", commit = "d9365e72afb2f876a62cd3cade555dc1a95031d9" })
    -- language server settings defined in json for
    use({ "tamago324/nlsp-settings.nvim", commit = "4c7afa00c149f8c3becb9a8e2b455e11d4501717" })
    use({ "b0o/SchemaStore.nvim", commit = "f39e340d71560fc5670820ac99f21d96096bba1d" })
    -- for formatters and linters
    use({ "jose-elias-alvarez/null-ls.nvim", commit = "753ad51790a966b42997ac935e26573fb6d5864a" })
    use({ "ray-x/lsp_signature.nvim", commit = "e65a63858771db3f086c8d904ff5f80705fd962b" })
    -- vscode-like pictograms
    use({ "onsails/lspkind-nvim", commit = "57e5b5dfbe991151b07d272a06e365a77cc3d0e7" })

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
