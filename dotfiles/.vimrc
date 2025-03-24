" Disable compatibility with vi
set nocompatible

" Enable type file detection
filetype on

" Enable plugins
filetype plugin on

" Load an indent file for the detected file type
filetype indent on

" Turn syntax highlighting on
syntax on

" Display number line
set number
highlight lineNr term=bold cterm=NONE ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" Set mouse support
set mouse=a

" Highlight cursor line underneath cursor horizontally
" set cursorline

" Highlight cursor line underneath cursor vertically
" set cursorcolumn

" Set shift width
set shiftwidth=4

" set tab width
set tabstop=4

" set backspace erase tab
set backspace=indent,eol,start

" Use space character instead of tabs
set expandtab

" Use autoindent
set smartindent

" Do not save backup files
set nobackup

" Do not let cursor scroll below or above number of line when scrolling
set scrolloff=6

" Do not wrap lines
set nowrap

" Hightlight matching search
set incsearch

" Override the ignorecase option
" set smartcase

set showcmd
set showmode
set showmatch

" Use highlight when search
set hlsearch

" Enable autocompletion menu
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.jpeg,*.png,*.gif,*.pdf,*.pyc,*.flv,*.img,*.xlsx


" PLUGINS -------------------------------------------
"


" MAPPINGS ------------------------------------------
"


" VIMSCRIPT -----------------------------------------
"
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" STATUS LINE ---------------------------------------
"

