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

set mouse=a
"设置Tap键
set expandtab
set tabstop=4
"设置滚动到最后一行时剩余行数
set scrolloff=5
"设置一个匹配规则
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" this can help you get your cursor in where you last out
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Plugin What you want
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
