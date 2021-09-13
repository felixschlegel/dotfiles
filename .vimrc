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

" ale linting
Plug 'dense-analysis/ale'

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

" NERDTree customizations
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" remove grey background from vim-signature marks
hi SignColumn guibg=none
hi SignColumn ctermbg=none
hi SignatureMarkText ctermbg=none

" Show files in buffer in top airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
" Show ale linting in airline
let g:airline#extensions#ale#enabled = 1

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

" do not search filenames with ripgrep
command! -bang -nargs=* Rg
    \   call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
    \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

" ale customizations
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '▲'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

" remove whitespace when saving files
autocmd BufWritePre * :%s/\s\+$//e

" custom key mappings
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <C-p> :Files<CR>
nnoremap <C-h> :bprev<CR>
nnoremap <C-l> :bn<CR>
nnoremap <C-q> :bd<CR>
" ripgrep for in-file searching (needs to be installed: brew install ripgrep)
nnoremap <C-_> :Rg<CR>

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
