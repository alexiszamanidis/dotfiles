syntax on

set exrc
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set number relativenumber
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set signcolumn=yes
set colorcolumn=80
" there is a bug with 'jiangmiao/auto-pairs' plugin, probably with others as well
" set paste
set complete+=kspell
" probably I need to uncomment the set below, and comment out the 'set nohlsearch'
" set hlsearch
set completeopt=menuone,longest
set shortmess+=c

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'preservim/nerdtree'
Plug 'farmergreg/vim-lastplace'
Plug 'jiangmiao/auto-pairs'

Plug 'vim-scripts/AutoComplPop'
Plug 'ervandew/supertab'

call plug#end()

let mapleader = " "

" fzf palette
nnoremap <C-p> :Files<Cr>

" nerd tree
nnoremap <C-b> :NERDTreeToggle<CR>

" behave like the rest of the CAPITAL letters
nnoremap Y y$

" Keeping it centered
nnoremap n nzzzv
nnoremap N Nzzzv

" move line up-down
nnoremap <A-Down> :m .+1<CR>==
nnoremap <A-Up> :m .-2<CR>==
inoremap <A-Down> <Esc>:m .+1<CR>==gi
inoremap <A-Up> <Esc>:m .-2<CR>==gi
vnoremap <A-Down> :m '>+1<CR>gv=gv
vnoremap <A-Up> :m '<-2<CR>gv=gv
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" save file
inoremap <C-s> <esc>:w<cr>
nnoremap <C-s> :w<cr>
" save file and exit
inoremap <C-d> <esc>:wq!<cr>
nnoremap <C-d> :wq!<cr>
" quit file discarding changes
inoremap <C-q> <esc>:qa!<cr>
nnoremap <C-q> :qa!<cr>
" copy line
inoremap <C-c> Y
nnoremap <C-c> Y
" paste
" inoremap <C-v> p
" nnoremap <C-v> p
" delete line
inoremap <C-x> dd
nnoremap <C-x> dd
" undo
inoremap <C-z> u
nnoremap <C-z> u
