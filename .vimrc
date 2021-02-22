set nocompatible
filetype off


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !has('nvim')
    if has("gui_running") && !has("gui_macvim")
        set rtp+=$HOME/bundle/Vundle.vim/
        call vundle#begin('$HOME/bundle/')
    else                                                            " Vundle for others (macvim)
        set rtp+=~/.vim/bundle/Vundle.vim
        call vundle#begin()
    endif

    Plugin 'VundleVim/Vundle.vim'
    Plugin 'flazz/vim-colorschemes'
    Plugin 'vim-scripts/ScrollColors'                               " Colour wheel
    Plugin 'junegunn/goyo.vim'                                      " Comfortable page spacing
    Plugin 'tpope/vim-surround'                                     " Parentheses; bracket; tag changings
    Plugin 'Yggdroot/indentLine'                                    " support for using spaces to indent
    Plugin 'itchyny/lightline.vim'                                  " minimal statusline

    " Software project management
    Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }           " command-line fuzzy finder
    Plugin 'junegunn/fzf.vim'                                       " vim-bindings for fzf 
    Plugin 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}    " code completion
    Plugin 'preservim/nerdtree'                                     " file system explorer
    Plugin 'Xuyuanp/nerdtree-git-plugin'                            " nerdtree git status flags

    " Language specific plugins
    Plugin 'dense-analysis/ale'                                     " Asynchronous Lint Engine
    Plugin 'sheerun/vim-polyglot'                                   " Many vim language packs
    Plugin 'mattn/emmet-vim'                                        " HTML settings
    Plugin 'ap/vim-css-color'                                       " css hex colour highlighting

    Plugin 'mhinz/vim-signify'                                      " Shows git differences in left-hand column
    Plugin 'machakann/vim-sandwich'                                 " add/delete/replace surroundings of a sandwiched textobject, like (foo), 'bar'
    Plugin 'easymotion/vim-easymotion'                              " More navigable motions
    Plugin 'editorconfig/editorconfig-vim'                          " consistent coding styles for github repositories, using `.editorconfig` files
    Plugin 'AndrewRadev/splitjoin.vim'                              " Easily split and join lines of code


    if has('nvim') || has('patch-8.0.902')                          " Shows git differences in left-hand column
    Plugin 'mhinz/vim-signify'
    else
    Plugin 'mhinz/vim-signify', { 'branch': 'legacy' }
    endif

    call vundle#end()
endif

filetype plugin indent on
filetype plugin on


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Styling
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("nvim")
    colorscheme obsidian
    set colorcolumn=0
else
    colorscheme parsec
    set colorcolumn=80
endif
syntax enable
set number
if !has('nvim')
    set antialias                                               " smoother fonts
endif
set title                                                       " gives window the title of file
set wildmenu                                                    " tab completion in NORM gives menu
set encoding=utf-8                                                               

set noerrorbells
set novisualbell
set belloff=all                                                 " disable all bells
set t_vb=


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Formatting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_macvim")                                            " macvim window size
    set lines=56 columns=90
elseif has("gui_running")                                       " gvim window size
    set lines=50 columns=85
endif

" if wrapping enabled, wrap whole at the end of a word
set linebreak
" by default wrapping is disabled
set nowrap
set tabstop=4                                                    " use 4 spaces for tabs
set softtabstop=4
set shiftwidth=4
set noexpandtab                                                  " don't replace a tab with spaces
set smarttab
set smartindent                                                  " autoindenting when starting new line
set autoindent
set shiftround                                                   " indents rounded to a multiple

" display indentation guides
" set list listchars=tab:\|\ ,trail:∙
set list listchars=tab:\|\ ,

set laststatus=2            " necessary to display the lightline statusline


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Searching
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch
set noincsearch                                                   " don't constantly update search
set ignorecase
set smartcase
set noshowmatch                                                   " briefly jump to matching bracket
set wildignore=*.swp,*.pyc,*.class                                " These are ignored in wildcard searches
set grepprg=rg\ --vimgrep                                         " Program used with the :grep command


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Miscellaneous Vim Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noswapfile                                                    " Turns off vim swap files
if has ("gui_running")
    set backspace=2                                               " Ensure Backspace key works in Insert mode for gVim
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" this is the default mapleader anyway, but for posterity:
let mapleader="\\"

nnoremap <space> :w<CR>:nohl<CR>
command WQ wq
command Wq wq
command W w
command Q q

" Mapping to close a buffer without losing the split window layout
"   See: https://stackoverflow.com/questions/4465095/vim-delete-buffer-without-losing-the-split-window
command Bdd bp|bd #        

" maps normal-mode <tab> key to switching windows
nnoremap <tab> <C-W>w
" normal-mode backspace to switch into other direction
nnoremap <bs> <C-W>W

map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
    " expands on tab edit
" maps the F3 key to file viewer
nnoremap <F3> :Explore<CR> 

" Command-line 'paste'command from system register
"   e.g. use ctrl-p to paste from the clipboard for some command argument
cnoremap <C-P> <C-R>+

" CoC Code Completion Mappings
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>qf  <Plug>(coc-fix-current)
nmap <leader>rn <Plug>(coc-rename)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Word Processor
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" `:call WP()`      opens the word processor mode
" `z=`              displays corrections
" `zg`              adds words to dictionary
function! WP()
    setlocal noexpandtab
    setlocal formatoptions=1
    map j gj
    map k gk
    setlocal formatprg=par
    setlocal wrap
    setlocal linebreak          " line wraps don't break up words
    set colorcolumn=

    set guioptions-=r
    set guioptions-=l

    " setlocal spellfile="C:\Program Files (x86)\Vim\vimfiles\spell\en.utf-8.add"
    setlocal spell spelllang=en_au      " http://vimdoc.sourceforge.net/htmldoc/spell.html
    setlocal syntax=off
    retab

    Goyo 95%x95%-2%             " margins

    if has("gui_macvim")
        " setlocal formatprg=par
        setlocal guifont=Monaco:h12
        colorscheme Benokai
        setlocal lines=42 columns=83
    else
        colorscheme pencil
        setlocal lines=65 columns=90
    endif
endfunction

function! LazyWP()
    setlocal noexpandtab
    setlocal formatoptions=1
    map j gj
    map k gk
    setlocal formatprg=par
    setlocal wrap
    setlocal linebreak          " line wraps don't break up words
    set colorcolumn=

    if has("gui_macvim")
        setlocal lines=41 columns=65
        colorscheme gruvbox
    else
        colorscheme materialtheme
        " setlocal lines=65 columns=90
    endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FZF Fuzzy Finder
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>f :Files<CR>
map <leader>b :Buffer<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Coc code completion settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Coc (Language) Extensions
let g:coc_global_extensions = [
        \'coc-pyright',
        \'coc-emmet',
        \'coc-css',
        \'coc-html',
        \'coc-json',
        \'coc-phpls',
        \'coc-snippets',
        \'coc-eslint',
        \'coc-tslint-plugin',
        \'coc-tsserver',
        \'coc-omnisharp',
        \]
" coc-prettier is too annoying with ALE highlighting


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerdtree Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Opens Nerdtree automatically if vim starts with no specified files
" Also, increases the amount of columns that it uses
if !has('nvim')
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * 
                \ if argc() == 0 && !exists("s:std_in") 
                \ | NERDTree 
                \ | set columns+=20
                \ | endif
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Variables
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lightline statusline colorscheme (see :help g:lightline.colorscheme)

" what lightline display when active
let g:lightline = {
    \ 'colorscheme': 'seoul256', 
    \ 'active': {
    \     'left': [   [ 'mode', 'paste'],
    \                 [ 'relativepath' ],
    \                 [ 'readonly', 'modified'], ],
    \     'right': [  [ 'lineinfo' ],
    \                 [ 'percent'],
    \                 [ 'fileformat', 'fileencoding', 'filetype'], ],
    \ }
    \ }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => End-of-Vimrc commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set cmdheight=1
set shortmess+=c
set noshowcmd
silent!
syntax on
set expandtab
retab
