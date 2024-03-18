-- ensure the packer plugin manager is installed
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer()

require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")
    --- VimWiki
    use { 'vimwiki/vimwiki' }

    -- Treesitter
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')

    -- Undo Treesitter
    use('mbbill/undotree')

    -- Search
    use("nvim-lua/popup.nvim")
    use("nvim-lua/plenary.nvim")
    use("nvim-telescope/telescope.nvim")
    use("tpope/vim-fugitive")
    use {
        'junegunn/fzf.vim',
        requires = { 'junegunn/fzf', run = ':call fzf#install()' }
    }

    -- Harpoon
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { { "nvim-lua/plenary.nvim" } }
    }

    -- Colors
    use { "ellisonleao/gruvbox.nvim" }
    use('projekt0n/github-nvim-theme')
    use('rodnaph/vim-color-schemes')
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
    })
    use('rebelot/kanagawa.nvim')

    -- Align
    use 'junegunn/vim-easy-align'

    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            { 'neovim/nvim-lspconfig' },
            {
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-buffer' },
            { 'L3MON4D3/LuaSnip' },
            { 'onsails/lspkind-nvim' }
        }
    }
    use { 'neovim/nvim-lspconfig' }
    use({
        'nvimdev/lspsaga.nvim',
        after = 'nvim-lspconfig',
        config = function()
            require('lspsaga').setup({})
        end,
    })

    use { 'mfussenegger/nvim-lint' }

    -- CoPilot
    use { 'github/copilot.vim' }

    -- Zen mode
    use { 'folke/zen-mode.nvim' }

    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                triggers = { "<leader>" }
                -- refer to the configuration section below
            }
        end
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    --- writing
    use { 'preservim/vim-pencil' }
    use { 'rhysd/vim-grammarous' }
    use { 'junegunn/goyo.vim' }
    use { 'kamykn/spelunker.vim' }


    -- floating term
    use { 'voldikss/vim-floaterm' }

    -- File tree
    -- - hop up a level, ~ go home
    use { "tpope/vim-vinegar" }
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    }


    use({ 'glepnir/nerdicons.nvim', cmd = 'NerdIcons', config = function() require('nerdicons').setup({}) end })
    use { 'nvim-tree/nvim-web-devicons' }

    -- Dashboard
    use { 'mhinz/vim-startify' }

    -- Tab switching
    use { 'akinsho/nvim-bufferline.lua' }

    -- Git
    use { 'lewis6991/gitsigns.nvim' }

    use {
        "antosha417/nvim-lsp-file-operations",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-neo-tree/neo-tree.nvim",
        },
        config = function()
            require("lsp-file-operations").setup()
        end,
    }

    -- case converter
    use { "tpope/vim-abolish" }

    -- clipboard
    use { 'ojroques/vim-oscyank', branch = "main" }

    -- Quickfix list toggle
    use { "milkypostman/vim-togglelist" }

    -- Run commands in tmux window
    use { 'preservim/vimux' }
    use { 'tyewang/vimux-jest-test' }

    -- worktrees
    use { 'ThePrimeagen/git-worktree.nvim' }

    -- snippets
    use { 'L3MON4D3/LuaSnip' }
    use {
        'hrsh7th/nvim-cmp',
        config = function()
            require 'cmp'.setup {
                snippet = {
                    expand = function(args)
                        require 'luasnip'.lsp_expand(args.body)
                    end
                },

                sources = {
                    { name = 'luasnip' },
                    -- more sources
                },
            }
        end
    }
    use { 'saadparwaiz1/cmp_luasnip' }
    use { 'rafamadriz/friendly-snippets' }


    -- the first run will install packer and our plugins
    if packer_bootstrap then
        require("packer").sync()
        return
    end
end)

vim.cmd([[
    let g:vimwiki_list = [{
	\ 'path': '~/wiki',
	\ 'template_path': '~/wiki/.templates/',
	\ 'template_default': 'default',
	\ 'syntax': 'markdown',
	\ 'ext': '.md',
	\ 'path_html': '~/wiki/.site_html/',
	\ 'custom_wiki2html': 'vimwiki_markdown',
	\ 'template_ext': '.html',
    \ 'auto_tags': 1,
    \'links_space_char': '_' },
    \{
	\ 'path': '~/wiki/etsy',
	\ 'template_path': '~/wiki/.templates/',
	\ 'template_default': 'default',
	\ 'syntax': 'markdown',
	\ 'ext': '.md',
	\ 'path_html': '~/wiki/.site_html/',
	\ 'custom_wiki2html': 'vimwiki_markdown',
	\ 'template_ext': '.html',
    \ 'auto_tags': 1,
    \'links_space_char': '_' },
    \{
	\ 'path': '~/wiki/personal',
	\ 'template_path': '~/wiki/.templates/',
	\ 'template_default': 'default',
	\ 'syntax': 'markdown',
	\ 'ext': '.md',
	\ 'path_html': '~/wiki/.site_html/',
	\ 'custom_wiki2html': 'vimwiki_markdown',
	\ 'template_ext': '.html',
    \ 'auto_tags': 1,
    \'links_space_char': '_' },
    \{
	\ 'path': '~/wiki/work',
	\ 'template_path': '~/wiki/.templates/',
	\ 'template_default': 'default',
	\ 'syntax': 'markdown',
	\ 'ext': '.md',
	\ 'path_html': '~/wiki/.site_html/',
	\ 'custom_wiki2html': 'vimwiki_markdown',
	\ 'template_ext': '.html',
    \ 'auto_tags': 1,
    \'links_space_char': '_' }]
    let g:vimwiki_auto_header=1
]])