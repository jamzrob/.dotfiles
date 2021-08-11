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
Plug 'ayu-theme/ayu-vim'
Plug 'tpope/vim-fugitive'
call plug#end()

set termguicolors
let ayucolor = "dark"
colorscheme ayu

let mapleader = " "

nnoremap <leader>pv :Vex<CR>
nnoremap <leader>sv :Sex<CR>
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>pf :Files<CR>
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>
nnoremap <leader>P o<esc>P<CR>
vnoremap <leader>p "_dP

" yanks to system clipboard
vnoremap <leader>y "+y 
nnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

" moves stuff around after highlighting
vnoremap J :m '>+1<CR>gv=gv " moves stuff around after highlighting
vnoremap K :m '<-2<CR>gv=gv


