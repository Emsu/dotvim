call plug#begin()
" Basic vim configuration
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'                               " Git
Plug 'vim-airline/vim-airline'                          " Status line
Plug 'vim-airline/vim-airline-themes'
Plug 'ludovicchabant/vim-gutentags'                     " Ctags generator
Plug 'ctrlpvim/ctrlp.vim'                               " File Searcher
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' } " Autocomplete
Plug 'altercation/vim-colors-solarized'                 " Theme

" Syntax Checker
if has('nvim')
    Plug 'benekastah/neomake'
else
    Plug 'scrooloose/syntastic'
endif

" Syntax Plugins
Plug 'mxw/vim-jsx', { 'for': 'javascript.jsx' }
call plug#end()

set expandtab
set number
set ignorecase
set relativenumber
set scrolloff=4
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Set leader key to comma
let mapleader=","

" Replace hard eol with soft eol
nmap 0 ^

" Use F2 to toggle paste
set pastetoggle=<F2>

" Highlight current line
set cursorline
hi CursorLine cterm=NONE ctermbg=black gui=NONE guibg=black

" Easy window navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Set languages to 2 spaces
autocmd Filetype ruby,html,css,scss,javascript,jinja,yaml,ansible setlocal ts=2 sts=2 sw=2

" Edit the vimrc file with <leader>v
nmap <leader>v :tabedit $MYVIMRC<CR>

" Airline Config
let g:airline_powerline_fonts = 1
let g:airline_theme = 'powerlineish'
" Set terminal config for Powerline usage
set t_Co=256
set laststatus=2   " Always show the statusline

" Use <LEADER>/ to clear the search buffer
nmap <silent> <leader>/ :nohlsearch<CR>

" Auto-save on losing focus
au FocusLost * :wa

" Delete trailing white space
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py,*.rb :call DeleteTrailingWS()

" Run syntax checkers
if has('nvim')
    autocmd! BufWritePost * Neomake
endif

" Set theme
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

" Allow JSX in normal JS files
let g:jsx_ext_required = 0
