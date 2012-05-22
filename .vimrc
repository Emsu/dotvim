let g:Powerline_symbols = 'fancy'
set t_Co=256

set encoding=utf-8 " Necessary to show unicode glyphs
set laststatus=2   " Always show the statusline
set nocompatible
set hidden
set number
set autoindent
set copyindent
set shiftround
set showmatch
set smartcase
set hlsearch
set incsearch
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
autocmd FileType html :setlocal sw=2 ts=2 sts=2 " Two spaces for HTML files "

" Without color scheme, set line colors to grey
hi LineNr term=bold cterm=NONE ctermfg=darkgrey ctermbg=NONE gui=NONE guifg=darkgrey guibg=NONE

" Set CursorLine to highlight current line
set cursorline
hi CursorLine cterm=NONE ctermbg=black gui=NONE guibg=black

" Set leader key to comma
let mapleader=","

" Use F2 to toggle paste
set pastetoggle=<F2>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Use <LEADER>/ to clear the search buffer
nmap <silent> ,/ :nohlsearch<CR>

" Auto-save on losing focus
au FocusLost * :wa

" Sort CSS properties with <LEADER>S
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" Edit the vimrc file with <leader>v
nmap <silent> <leader>v :tabedit $MYVIMRC<CR>

call pathogen#infect()
call pathogen#helptags()
syntax on
filetype plugin indent on
