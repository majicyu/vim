set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

set encoding=utf-8
" 设置语法高亮
syntax on
" 设置显示行号
set number
" 设置显示动态行号
set norelativenumber
" 设置显示当前所在行
set cursorline
" 设置列数限制
set wrap
" 显示命令
set showcmd
" 命令补全
set wildmenu

"搜索相关

"搜索高亮
set hlsearch
"设置进入文件时不高亮
exec "nohlsearch"
"边搜边高亮
set incsearch
"忽略大小写
set ignorecase
"智能识别大小写
set smartcase

let &t_ut=''

"设置Tap键
set expandtab
set tabstop=4
"设置滚动到最后一行时剩余行数
set scrolloff=5
"设置一个匹配规则
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'
" File Navigation
Plug 'preservim/nerdtree'

" Auto Complete
Plug 'neoclide/coc.nvim', {'branch':'release'}
call plug#end()

colorscheme snazzy
let g:SnazzyTransparent = 1
