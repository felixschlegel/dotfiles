" vimplug
call plug#begin()

" fzf fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" vim-fugitive (required to show current git branch in vim-airline)
Plug 'tpope/vim-fugitive'

" ale linting
Plug 'dense-analysis/ale'

" coc autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

" vim surround
Plug 'tpope/vim-surround'
" required to use . for surround actions
Plug 'tpope/vim-repeat'
" comment out lines with ease
Plug 'tpope/vim-commentary'

" nerdtree
Plug 'preservim/nerdtree'

" vim-markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

"vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" vim-gitgutter to show changes in sidebar
Plug 'airblade/vim-gitgutter'

" vimspector graphical debugger
Plug 'puremourning/vimspector'

" vim-signature (marks in sidebar)
Plug 'kshenoy/vim-signature'

" context.vim (sticky headers)
Plug 'wellle/context.vim'

call plug#end()

set nocompatible " be iMproved
filetype plugin indent on
syntax on

colorscheme industry
" transparent background (uses terminal background)
hi Normal guibg=NONE ctermbg=NONE

set number relativenumber " Show relative line numbers
set nu rnu " necessary for hybrid line numbers
set tabstop=4 " Change Tab size from 8 to 4
set shiftwidth=4
set expandtab " replace tabs with appropiate num of spaces
set incsearch " Search while typing
set nofoldenable " disable folding
" disable bell
set visualbell
set t_vb=
set linebreak " wrap lines based on words

set colorcolumn=120 " vertical column
highlight ColorColumn ctermbg=238

" NERDTree customizations
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" remove grey background from vim-signature marks
hi SignColumn guibg=NONE
hi SignColumn ctermbg=NONE
hi SignatureMarkText ctermbg=NONE

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

" coc customizations
highlight Pmenu ctermbg=233 ctermfg=gray
highlight PmenuSel ctermbg=darkgray ctermfg=white

" remove whitespace when saving files
autocmd BufWritePre * :%s/\s\+$//e

" Use coc jump to definition instead of vim default
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> <C-]> <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)
" See :help coc-key-mappings@en for more

" puremourning/vimspector
nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>
nnoremap <leader>dc :call vimspector#Continue()<CR>
nnoremap <leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <leader>dT :call vimspector#ClearBreakpoints()<CR>
nmap <leader>dk <Plug>VimspectorRestart
nmap <leader>dh <Plug>VimspectorStepOut
nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dj <Plug>VimspectorStepOver
let g:vimspector_base_dir = expand("$HOME/.config/vimspector-config")

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
nnoremap * *zz
nnoremap # #zz

" keep cursor centered when jumping changelist
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap gi g;zzi

" keep cursor centered when jumping jump list
noremap <C-o> <C-o>zz
noremap <C-i> <C-i>zz

" keep cursor centered when jumping to mark
map <expr> M printf('`%c zz', getchar())

" keep cursor centered when jumping to line
cnoremap <expr> <CR> (getcmdtype() == ":" && getcmdline() =~ '\d\+') ? "<CR>zz" : "<CR>"

" omnicomplete configuration
" select longest common text
set completeopt=longest,menuone,noinsert
" select popup item on enter
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" popup navigation
inoremap <expr> <C-j> coc#pum#visible() ? coc#pum#next(1) : "\<C-j>"
inoremap <expr> <C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"
" keep match highlighted while typing
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
    \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Map :W to :w
command! WQ wq
command! Wq wq
command! W w

" Disable arrow keys
nnoremap <Left> <nop>
nnoremap <Right> <nop>
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <PageUp> <nop>
nnoremap <PageDown> <nop>

inoremap <Left> <nop>
inoremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <PageUp> <nop>
inoremap <PageDown> <nop>

vnoremap <Left> <nop>
vnoremap <Right> <nop>
vnoremap <Up> <nop>
vnoremap <Down> <nop>
vnoremap <PageUp> <nop>
vnoremap <PageDown> <nop>

" C/C++ indentation
autocmd FileType c setlocal shiftwidth=2 tabstop=2 cindent
autocmd FileType cpp setlocal shiftwidth=2 tabstop=2 cindent
