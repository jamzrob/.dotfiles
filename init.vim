set guicursor=
set scrolloff=8
set number
set relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set clipboard=unnamedplus

call plug#begin(stdpath('data') . '/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'tpope/vim-fugitive'
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
call plug#end()
" Colors
set termguicolors
let ayucolor = "dark"
colorscheme ayu
    
highlight LspDiagnosticsDefaultError guifg=#FF0000
set background=dark

set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

lua require'lspconfig'.pyright.setup{on_attach=require'completion'.on_attach}
lua require'lspconfig'.tsserver.setup{on_attach=require'completion'.on_attach}  
let mapleader = " "

nnoremap <leader>pv :Vex<CR>
nnoremap <leader>sv :Sex<CR>
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>

" explore files
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>pf :Files<CR>

nnoremap <C-j> :cnext<CR>zzza
nnoremap <C-k> :cprev<CR>
nnoremap <leader>P o<esc>P<CR>
vnoremap <leader>p "_dP

" yanks to system clipboard
vnoremap <leader>y "+y 
nnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

" moves text 
vnoremap J :m '>+1<CR>gv=gv " moves stuff around after highlighting
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <exc>:m .-2<CR>==
nnoremap <leader>k :m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==

" make y behave like other capital letters
nnoremap Y y$

" keep it centered how
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" undo breakpoints
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" jumplist populated every time more than 5
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'


