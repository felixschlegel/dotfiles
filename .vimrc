" Required template code for Vundle
set shell=/bin/bash
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle itself is managed by Vundle
Plugin 'VundleVim/Vundle.vim'

" nerdtree
Plugin 'preservim/nerdtree'

" vim-markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

"vim-airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" vim-gitgutter to show changes in sidebar
Plugin 'airblade/vim-gitgutter'

" vim-signature (marks in sidebar)
Bundle "kshenoy/vim-signature"

call vundle#end()

" vimplug
call plug#begin()

" fzf fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" vim-fugitive (required to show current git branch in vim-airline)
Plug 'tpope/vim-fugitive'

call plug#end()

filetype plugin indent on
syntax on
colorscheme industry 
set number relativenumber " Show relative line numbers
set nu rnu " necessary for hybrid line numbers
set tabstop=4  " Change Tab size from 8 to 4
set shiftwidth=4
set expandtab
set incsearch " Search while typing
set nofoldenable " disable folding
set visualbell " disable audio bell

set colorcolumn=120 " vertical column
highlight ColorColumn ctermbg=238

" remove grey background from vim-signature marks
hi SignColumn guibg=none
hi SignColumn ctermbg=none
hi SignatureMarkText ctermbg=none

" Show files in buffer in top airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" vim-gitgutter colors
let g:gitgutter_override_sign_column_highlight = 0
highlight clear SignColumn
highlight GitGutterAdd ctermfg=2
highlight GitGutterChange ctermfg=3
highlight GitGutterDelete ctermfg=1
highlight GitGutterChangeDelete ctermfg=4

" open file in new tab when using fzf
let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-v': 'vsplit'}

" custom key mappings
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <C-p> :Files<CR>
nnoremap <C-h> :tabprev<CR>
nnoremap <C-l> :tabn<CR>

" keep cursor centered when searching
nnoremap n nzzzv
nnoremap N Nzzzv

" keep cursor centered when jumping to mark
map <expr> M printf('`%c zz', getchar())

" Disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
