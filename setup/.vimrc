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
" Git interface 
Plugin 'tpope/vim-fugitive'
" python autocompletion 
Plugin 'davidhalter/jedi-vim'
" Colour themes for Vim
Plugin 'morhetz/gruvbox'
Plugin 'nanotech/jellybeans.vim'
" Code structure i.e. table of content of classes, methods and functions
Plugin 'yegappan/taglist'
" Linter for python
Plugin 'dense-analysis/ale' 

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
" Enable file type detection
filetype on
syntax enable

" Case insensitive search
set ignorecase
set smartcase

" Spelling
set spell spelllang=en_gb,fr

" Split settings
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" wrap markdown text to 80 characters
au BufRead,BufNewFile *.md setlocal textwidth=80
" Do not use double spaces after points
set nojoinspaces

" disable folding in vim-markdown 
let g:vim_markdown_folding_disabled = 1
" enable vim-markdown for .Rmd files too
augroup filetypedetect_markdown
    au!
    au BufRead,BufNewFile *.Rmd set ft=markdown
augroup END

" use tmux with slime
let g:slime_target = "tmux"
" configuration for vim in a split tmux window with a REPL in the other pane:
let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}
" Handle indentation correctly  https://github.com/jpalardy/vim-slime/issues/54
" let g:slime_python_ipython = 1

""""""""""""""""""
" AZERTY keyboard "
""""""""""""""""""
noremap m $
" Move into wrapped lines with arrow keys
nnoremap <Up> gk
nnoremap <Down> gj
""""""""""""""""""""""""
" Python configuration "
""""""""""""""""""""""""
" Indentation settings
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
filetype indent on 

" Tell jedi vim to use python2 for the engine only
" https://github.com/davidhalter/jedi-vim/issues/841
" let g:jedi#loader_py_version = 2
"
" jedi go to definition
noremap <F2> <leader>-d
" jedi  do not start completion when I type a dot
let g:jedi#popup_on_dot = 0
" change leader key from \ (the default) to ,
:let mapleader = ","

" Pytest
nmap <silent><Leader>f <Esc>:Pytest file<CR>
nmap <silent><Leader>c <Esc>:Pytest class<CR>
nmap <silent><Leader>m <Esc>:Pytest method<CR>
" Toggle taglist
nnoremap <silent> <F8> :TlistToggle<CR>
"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
" specify which ALE linter is complaining
let g:ale_echo_msg_format = '[%linter%] %s'
" Disable ale for some file extensions
let g:ale_pattern_options = {
\   '.*\.md$': {'ale_enabled': 0},
\   '.*\.Rmd$': {'ale_enabled': 0},
\}
"""""""""""""""""""""""
" Change colour theme "
"""""""""""""""""""""""
set t_Co=256
" terminal’s color palette #444444 is suggested by jellybeans.vim,
" I used 353131
" This is suggested by a stackoverflow answer
set background=dark
"autocmd vimenter * colorscheme gruvbox
colorscheme jellybeans

" Underline bad spelling instead of highlighting it
" this should be placed after colorscheme and background colour
hi clear SpellBad
"hi SpellBad cterm=underline
hi SpellBad cterm=underline ctermbg=black

" Activate bracketed paste in tmux
if &term =~ "screen"
  let &t_BE = "\e[?2004h"
  let &t_BD = "\e[?2004l"
  exec "set t_PS=\e[200~"
  exec "set t_PE=\e[201~"
endif

" Open git grep in a quickfix window
autocmd QuickFixCmdPost *grep* cwindow

" To reload :source ~/.vimrc
