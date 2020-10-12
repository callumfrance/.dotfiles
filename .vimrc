set nocompatible

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-scripts/ScrollColors'                       " Colour wheel
Plugin 'junegunn/goyo.vim'                              " Comfortable page spacing
Plugin 'tpope/vim-surround'                             " Parentheses; bracket; tag changings
Plugin 'airblade/vim-gitgutter'                         " Shows changes between git commits
Plugin 'Yggdroot/indentLine'                            " support for using spaces to indent
Plugin 'itchyny/lightline.vim'                          " minimal statusline

" Software project management
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }   " command-line fuzzy finder
Plugin 'junegunn/fzf.vim'                               " vim-bindings for fzf 
Plugin 'neoclide/coc.nvim', {'do': { -> coc#util#install()}} " code completion
Plugin 'preservim/nerdtree'                             " file system explorer
Plugin 'Xuyuanp/nerdtree-git-plugin'                    " nerdtree git status flags

" Language specific plugins
Plugin 'mattn/emmet-vim'                                " HTML settings
Plugin 'ap/vim-css-color'                               " css hex colour highlighting
Plugin 'jparise/vim-graphql'                            " GraphQL detect; highl; indent
Plugin 'ianks/vim-tsx'                                  " typescript XML highl; indent
Plugin 'leafgarland/typescript-vim'                     " typescript syntax; highl; indent

call vundle#end()
filetype plugin indent on
filetype plugin on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Styling
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme peachpuff
set colorcolumn=80
" set background=dark
syntax enable
set number
" set antialias             " smoother fonts
set title                   " gives window the title of file
set wildmenu                " tab completion in NORM gives menu
" set synmaxcol=100           " max column syntax highlighing for
set encoding=utf-8

set noerrorbells
set novisualbell
set belloff=all               " disable all bells
set t_vb=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Formatting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" if has("gui_macvim")
"     set lines=60 columns=100
" else
"     " set lines=50 columns=80
"     set lines=35 columns=80
"     "winpos 9999 2
" endif

" set tw=200                " Length of all columns
" if wrapping enabled, wrap whole at the end of a word
set linebreak
" by default wrapping is disabled
set nowrap
set tabstop=4               " use 4 spaces for tabs
set softtabstop=4
set shiftwidth=4
set noexpandtab             " don't replace a tab with spaces
set smarttab
set smartindent             " autoindenting when starting new line
set autoindent
set shiftround              " indents rounded to a multiple

" display indentation guides
" set list listchars=tab:\|\ ,trail:∙
set list listchars=tab:\|\ ,

set laststatus=2            " necessary to display the lightline statusline


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Searching
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch
set incsearch                                   " don't constantly update search
set ignorecase
set smartcase
set showmatch                                   " briefly jump to matching bracket
set wildignore=*.swp,*.pyc,*.class              " These are ignored in wildcard searches
set grepprg=rg\ --vimgrep                       " Program used with the :grep command


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Autocommands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TypeScript
" au BufNewFile,BufRead *.ts setlocal filetype=typescript
" au BufNewFile,BufRead *.tsx setlocal filetype=typescriptreact

" Markdown
" autocmd BufNewFile,BufReadPost *.md set filetype=markdown


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" this is the default mapleader anyway, but for posterity:
let mapleader="\\"

nnoremap ; :
nnoremap <space> :w<CR>:nohl<CR>
command WQ wq
command Wq wq
command W w
command Q q
" maps normal-mode <tab> key to switching windows
nnoremap <tab> <C-W>w
" normal-mode backspace to switch into other direction
nnoremap <bs> <C-W>W

map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
    " expands on tab edit
" maps the F3 key to file viewer
nnoremap <F3> :Explore<CR> 


" CoC Code Completion Mappings
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Word Processor
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

    setlocal spellfile="C:\Program Files (x86)\Vim\vimfiles\spell\en.utf-8.add"
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Coc code completion settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Variables
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lightline statusline colorscheme (see :help g:lightline.colorscheme)
let g:lightline = {
      \ 'colorscheme': 'selenized_light',
      \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => End-of-Vimrc commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set cmdheight=1
set shortmess=at
set noshowcmd
silent!
syntax on
set expandtab
retab