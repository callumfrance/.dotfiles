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

Plug 'mhinz/vim-signify'                                      " Shows git differences in left-hand column
Plug 'machakann/vim-sandwich'                                 " add/delete/replace surroundings of a sandwiched textobject, like (foo), 'bar'
Plug 'editorconfig/editorconfig-vim'                          " consistent coding styles for github repositories, using `.editorconfig` files


" These have (probably) been made redundant by vim-polyglot
" Plug 'towolf/vim-helm'                                        " Vim syntax for helm templates
" Plug 'yuezk/vim-js'
" Plug 'maxmellon/vim-jsx-pretty'
" Plug 'rayburgemeestre/phpfolding.vim'                         " PHP folding syntaxer
" Plug 'leafgarland/typescript-vim'                             " typescript syntax; highl; indent
" Plug 'jparise/vim-graphql'                                    " GraphQL detect; highl; indent
" Plug 'ianks/vim-tsx'                                          " typescript XML highl; indent

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
let g:ale_fixers = {
        \ 'javascript': ['eslint']
    \ }

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save = 1
