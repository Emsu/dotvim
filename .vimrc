 set nocompatible               " be iMproved
 filetype off                   " required!

 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

 " let Vundle manage Vundle
 " required! 
 Bundle 'gmarik/vundle'

 " My Bundles here:
 "
 " original repos on github
 Bundle 'altercation/vim-colors-solarized'
 Bundle 'ervandew/supertab'
 Bundle 'kien/ctrlp.vim'
 Bundle 'Lokaltog/vim-powerline'
 Bundle 'msanders/snipmate.vim'
 Bundle 'tpope/vim-repeat'
 Bundle 'ocim/htmljinja.vim'
 Bundle 'hail2u/vim-css3-syntax'
 Bundle 'lunaru/vim-less'
 Bundle 'digitaltoad/vim-jade'
 Bundle 'pangloss/vim-javascript'
 Bundle 'hynek/vim-python-pep8-indent'
 Bundle 'tpope/vim-markdown'
 Bundle 'wavded/vim-stylus'
 Bundle 'saltstack/salt-vim'
 " vim-scripts repos
 Bundle 'taglist.vim'
 Bundle 'TaskList.vim'
 Bundle 'YankRing.vim'
 Bundle 'python.vim'
 Bundle 'pythoncomplete'
 Bundle 'Jinja'
 " non github repos
 " Bundle 'git://git.wincent.com/command-t.git'
 " ...

 filetype plugin indent on     " required!
 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..

set background=dark

" Set leader key to comma
let mapleader=","

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

let g:SuperTabLongestHighlight=1

" Powerline Config
let g:Powerline_symbols = 'fancy'

" Taglist Config
map <leader>e :TlistToggle<CR>
let Tlist_Show_One_File = 1
map <F8> :!ctags -R --c++-kinds=+p --python-kinds=-i --fields=+aS --extra=+q .<CR><CR>
set tags=tags;$HOME

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
set hlsearch
set incsearch
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set scrolloff=5

" Set javascript to 2 spaces
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2

" Without color scheme, set line colors to grey
hi LineNr term=bold cterm=NONE ctermfg=darkgrey ctermbg=NONE gui=NONE guifg=darkgrey guibg=NONE

" Set CursorLine to highlight current line
set cursorline
hi CursorLine cterm=NONE ctermbg=black gui=NONE guibg=black

" CtrlP
let g:ctrlp_map="<leader>f"
let g:ctrlp_clear_cache_on_exit=0 

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

syntax on
" Set theme to solarized dark
let g:solarized_termcolors=256
colorscheme solarized
