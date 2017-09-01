set nocompatible
call plug#begin('~/.vim/plugged')

" Theme Plugins
Plug 'altercation/vim-colors-solarized'

" Functional Plugins
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-repeat'
Plug 'w0rp/ale'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'vim-scripts/taglist.vim'
Plug 'vim-scripts/TaskList.vim'
Plug 'vim-scripts/YankRing.vim'
Plug 'google/yapf'
Plug 'ervandew/supertab'
" 'Valloric/YouCompleteMe'

" Syntax Plugins
Plug 'lunaru/vim-less'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-markdown'
Plug 'wavded/vim-stylus'
Plug 'lepture/vim-jinja'
Plug 'lukaszb/vim-web-indent'
Plug 'fatih/vim-go'
Plug 'elzr/vim-json'
Plug 'cakebaker/scss-syntax.vim'
Plug 'honza/dockerfile.vim'
Plug 'avakhov/vim-yaml'
Plug 'vim-ruby/vim-ruby'
Plug 'mxw/vim-jsx'
Plug 'vim-scripts/indenthtml.vim'
Plug 'python-mode/python-mode'

call plug#end()

" Set leader key to comma
let mapleader=","

let g:pymode_rope = 0

" Airline Config
let g:airline_powerline_fonts = 1

" JSX config
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" Python config
autocmd FileType python nnoremap <LocalLeader>= :0,$!yapf<CR>
autocmd FileType python nnoremap <LocalLeader>i :!isort %<CR><CR>
hi pythonSelf  ctermfg=68  guifg=#5f87d7 cterm=bold gui=bold
let g:pymode_folding = 0

" Taglist Config
map <leader>e :TlistToggle<CR>
let Tlist_Show_One_File = 1
map <F8> :!ctags -R --c++-kinds=+p --python-kinds=-i --fields=+aS --extra=+q .<CR><CR>
set tags=tags;$HOME

" Ale config
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_statusline_format = ['✗ %d', '⚠ %d', '⬥ ok']
highlight clear ALEErrorSign
highlight clear ALEWarningSign

let g:ycm_path_to_python_interpreter = '/usr/bin/python'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-m>"
let g:UltiSnipsListTrigger="<c-n>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" let g:UltiSnipsEditSplit="vertical" " :UltiSnipsEdit to split your window.

" Set terminal config for Powerline usage
set t_Co=256
set encoding=utf-8 " Necessary to show unicode glyphs
set laststatus=2   " Always show the statusline

" Set no backup and swp files
set nobackup
set nowb
set noswapfile

" Change VIM defaults
set autochdir
set hidden
set number
set autoindent
set copyindent
set shiftround
set showmatch
set ignorecase
set smartcase
set smartindent
set hlsearch
set incsearch
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set scrolloff=5

" Set javascript to 2 spaces
autocmd Filetype ruby,html,css,scss,javascript,jinja,yaml,ansible setlocal ts=2 sts=2 sw=2

" Without color scheme, set line colors to grey
hi LineNr term=bold cterm=NONE ctermfg=darkgrey ctermbg=NONE gui=NONE guifg=darkgrey guibg=NONE

" Set CursorLine to highlight current line
set cursorline
hi CursorLine cterm=NONE ctermbg=black gui=NONE guibg=black

" Use F2 to toggle paste
set pastetoggle=<F2>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Replace hard eol with soft eol
nmap 0 ^

" Use <LEADER>/ to clear the search buffer
nmap <silent> <leader>/ :nohlsearch<CR>

" Auto-save on losing focus
au FocusLost * :wa

" Edit the vimrc file with <leader>v
nmap <silent> <leader>v :tabedit $MYVIMRC<CR>

" Delete trailing white space, useful for Python ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.rb :call DeleteTrailingWS()

syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

hi SpellCap ctermfg=226 ctermbg=000 guifg=#ffff00 guibg=#000000
hi SpellBad ctermfg=196 ctermbg=000 guifg=#ff0000 guibg=#000000
