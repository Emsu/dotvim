set nocompatible               " be iMproved
filetype off                   " required!

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" My Plugins here:

" Theme Plugins
Plugin 'altercation/vim-colors-solarized'

" Functional Plugins
Plugin 'ervandew/supertab'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'msanders/snipmate.vim'
Plugin 'tpope/vim-repeat'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'garbas/vim-snipmate'
Plugin 'scrooloose/nerdtree'
Plugin 'taglist.vim'
Plugin 'TaskList.vim'
Plugin 'YankRing.vim'
" Plugin 'FredKSchott/CoVim'

" Syntax Plugins
Plugin 'ocim/htmljinja.vim'
Plugin 'lunaru/vim-less'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-markdown'
Plugin 'wavded/vim-stylus'
Plugin 'lepture/vim-jinja'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'lukaszb/vim-web-indent'
Plugin 'fatih/vim-go'
Plugin 'elzr/vim-json'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'honza/dockerfile.vim'
Plugin 'avakhov/vim-yaml'
Plugin 'vim-ruby/vim-ruby'
Plugin 'mxw/vim-jsx'
Plugin 'python.vim'
Plugin 'indenthtml.vim'

call vundle#end()
filetype plugin indent on     " required!

" Set leader key to comma
let mapleader=","

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

let g:SuperTabLongestHighlight=1

" Airline Config
let g:airline_powerline_fonts = 1

" JSX config
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
let g:syntastic_javascript_checkers = ['eslint']

" Taglist Config
map <leader>e :TlistToggle<CR>
let Tlist_Show_One_File = 1
map <F8> :!ctags -R --c++-kinds=+p --python-kinds=-i --fields=+aS --extra=+q .<CR><CR>
set tags=tags;$HOME

" Syntastic config
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_html_tidy_ignore_errors = ['proprietary attribute "ng-', 'trimming empty <i>', '<form> lacks "action" attribute', '<ng-include> is not recognized!', '<div> proprietary attribute "on"', 'discarding unexpected <ng-', 'discarding unexpected </ng-']

let g:syntastic_ruby_checkers = ['rubocop', 'mri']

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

" CtrlP
let g:ctrlp_clear_cache_on_exit=0 
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'

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
