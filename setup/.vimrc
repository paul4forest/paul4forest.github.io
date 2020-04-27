set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Navigate markdown toc
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

filetype on
syntax enable

set ignorecase
set smartcase

" Split settings
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" Indentation settings
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
filetype indent on 

" wrap markdown text to 80 characters
au BufRead,BufNewFile *.md setlocal textwidth=80
" Do not use double spaces after points
set nojoinspaces

" Spelling
set spell spelllang=en_gb,fr

" disable folding in vim-markdown 
let g:vim_markdown_folding_disabled = 1
" enable vim-markdown for .Rmd files too
augroup filetypedetect_markdown
    au!
    au BufRead,BufNewFile *.Rmd set ft=markdown
augroup END

