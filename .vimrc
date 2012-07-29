set background=dark
set nocompatible

" Set leader key to comma
let mapleader=","

let g:ackprg="ack-grep -H --nogroup --column"

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

let g:SuperTabLongestHighlight=1
let g:acp_enableAtStartup=0
let g:neocomplcache_enable_at_startup=1

" Syntastic Config
let g:syntastic_mode_map = { 'mode': 'passive',
            \ 'active_filetypes': [],
            \ 'passive_filetypes': ['python'] }

" Powerline Config
let g:Powerline_colorscheme="skwp"
let g:Powerline_symbols = 'fancy'

" Taglist Config
map <leader>e :TlistToggle<CR>
let Tlist_Show_One_File = 1
map <F8> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>
set tags=tags;$HOME

" Set terminal config for Powerline usage
set t_Co=256
set encoding=utf-8 " Necessary to show unicode glyphs
set laststatus=2   " Always show the statusline

" Set no backup and swp files
set nobackup
set nowb
set noswapfile

" Automatically set directory to directory of current file
set autochdir

" Change VIM defaults
set autochdir
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
set scrolloff=5

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

" Sort CSS properties with <LEADER>S
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>

" Edit the vimrc file with <leader>v
nmap <silent> <leader>v :tabedit $MYVIMRC<CR>

" Delete trailing white space, useful for Python ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

" Load plugins with Pathogen
call pathogen#infect()
call pathogen#helptags()
syntax on
filetype plugin indent on

" Set theme to solarized dark
let g:solarized_termcolors=256
colorscheme solarized
