set background=dark
set nocompatible

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

let g:SuperTabLongestHighlight=1
let g:acp_enableAtStartup=0
let g:neocomplcache_enable_at_startup=1

" Set Powerline config
let g:Powerline_colorscheme="skwp"
let g:Powerline_symbols = 'fancy'

" Set terminal config for Powerline usage
set t_Co=256
set encoding=utf-8 " Necessary to show unicode glyphs
set laststatus=2   " Always show the statusline

" Set Syntastic config
let g:syntastic_check_on_open=1

" Change VIM defaults
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

" Filetype tab changes
autocmd FileType html :setlocal sw=2 ts=2 sts=2 " Two spaces for HTML files "

" Without color scheme, set line colors to grey
hi LineNr term=bold cterm=NONE ctermfg=darkgrey ctermbg=NONE gui=NONE guifg=darkgrey guibg=NONE

" Set CursorLine to highlight current line
set cursorline
hi CursorLine cterm=NONE ctermbg=black gui=NONE guibg=black

" Set leader key to comma
let mapleader=","

" Map
let g:ctrlp_map="<leader>f"

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

" Load plugins with Pathogen
call pathogen#infect()
call pathogen#helptags()
syntax on
filetype plugin indent on

" Set theme to solarized dark
let g:solarized_termcolors=256
colorscheme solarized
