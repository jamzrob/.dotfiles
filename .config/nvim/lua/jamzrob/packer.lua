-- ensure the packer plugin manager is installed
local ensure_packer = function() local fn = vim.fn
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
    use("ThePrimeagen/harpoon")
    use {
        'junegunn/fzf.vim',
        requires = { 'junegunn/fzf', run = ':call fzf#install()' }
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
            { 'L3MON4D3/LuaSnip' }
        }
    }
    use { 'mfussenegger/nvim-lint' }

    -- CoPilot
    use  { 'github/copilot.vim' }

    -- Zen mode
            use{ 'folke/zen-mode.nvim' }

    -- which key 
        use {
          "folke/which-key.nvim",
          config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
          end
        }

        use {
          'nvim-lualine/lualine.nvim',
          requires = { 'nvim-tree/nvim-web-devicons', opt = true }
         }

 
     -- LSP Saga
        use ({
            'nvimdev/lspsaga.nvim',
            after = 'nvim-lspconfig',
            config = function()
                require('lspsaga').setup({})
            end,
        })


    -- the first run will install packer and our plugins
    if packer_bootstrap then
        require("packer").sync()
        return
    end
end)

vim.cmd([[
    let g:vimwiki_list = [{
	\ 'path': '~/vimwiki/',
	\ 'template_path': '~/vimwiki/.templates/',
	\ 'template_default': 'default',
	\ 'syntax': 'markdown',
	\ 'ext': '.md',
	\ 'path_html': '~/vimwiki/.site_html/',
	\ 'custom_wiki2html': 'vimwiki_markdown',
	\ 'template_ext': '.html',
    \ 'auto_tags': 1 }]

    let g:vimwiki_auto_header=1
]])

