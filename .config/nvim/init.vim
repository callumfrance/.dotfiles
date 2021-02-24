let g:ale_disable_lsp = 1                                     " allows Coc to control language server protocol and not ALE

"automated installation of vimplug if not installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

call plug#begin('~/.vim/plugged')
Plug 'flazz/vim-colorschemes'
Plug 'vim-scripts/ScrollColors'                               " Colour wheel
Plug 'junegunn/goyo.vim'                                      " Comfortable page spacing
Plug 'tpope/vim-surround'                                     " Parentheses; bracket; tag changings
Plug 'Yggdroot/indentLine'                                    " support for using spaces to indent
Plug 'itchyny/lightline.vim'                                  " minimal statusline

" Software project management
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }           " command-line fuzzy finder
Plug 'junegunn/fzf.vim'                                       " vim-bindings for fzf 
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}    " code completion
Plug 'preservim/nerdtree'                                     " file system explorer
Plug 'Xuyuanp/nerdtree-git-plugin'                            " nerdtree git status flags

" Language specific plugins
Plug 'dense-analysis/ale'                                     " Asynchronous Lint Engine
Plug 'sheerun/vim-polyglot'                                   " Many vim language packs
Plug 'mattn/emmet-vim'                                        " HTML settings
Plug 'ap/vim-css-color'                                       " css hex colour highlighting
Plug 'rayburgemeestre/phpfolding.vim'                         " PHP folding

Plug 'mhinz/vim-signify'                                      " Shows git differences in left-hand column
Plug 'machakann/vim-sandwich'                                 " add/delete/replace surroundings of a sandwiched textobject, like (foo), 'bar'
Plug 'easymotion/vim-easymotion'                              " More navigable motions
Plug 'editorconfig/editorconfig-vim'                          " consistent coding styles for github repositories, using `.editorconfig` files
Plug 'AndrewRadev/splitjoin.vim'                              " Easily split and join lines of code

call plug#end()

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
colorscheme obsidian
set mouse+=a
set colorcolumn=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALE Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_set_highlights = 1
highlight ALEError ctermbg=DarkCyan
highlight ALEWarning ctermbg=DarkGreen
let g:ale_fix_on_save = 1
" let g:ale_exclude_highlights = ['*prettier*', '*Replace*']  " this POS command does not work for some reason
" as such, do not use coc-prettier because it is too annoying

