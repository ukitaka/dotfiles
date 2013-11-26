scriptencoding utf-8

let $VIM_ROOT=$HOME.'/.vim'
set nocompatible

filetype off
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=$VIM_ROOT/bundle/neobundle.vim/
endif
call neobundle#rc(expand($VIM_ROOT.'/bundle'))

set termencoding=utf-8
set encoding=utf-8
set fenc=utf-8

" plugin
" --------------------------------------

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {'build' : {'mac' : 'make -f make_mac.mak', 'unix' : 'make -f make_unix.mak'} }
NeoBundle 'Shougo/vimshell', {'depends' : 'Shougo/vimproc' }
NeoBundle 'neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'unite.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'yuroyoro/yuroyoro256.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-markdown'

" general setting
" -------------------------------------
syntax enable
syntax on
filetype on
filetype plugin indent on
filetype indent on

set cindent             " Cライクな文法に従いインデント
set expandtab           " タブをnスペースにする
set autoindent
set scrolloff=5
set noswapfile
set nowritebackup
set nobackup
set number
set history=10000
set showcmd
set wrap
set incsearch
set shiftwidth=4
set tabstop=4
set laststatus=2

" color setting
" -----------------------------------
colorscheme yuroyoro256
set t_Co=256
set t_Sf=[3%dm
set t_Sb=[4%dm
hi PmenuSel cterm=reverse ctermfg=33 ctermbg=222 gui=reverse guifg=#3399ff guibg=#f0e68c


" key-mapping
" ------------------------------------
map <c-j> <esc>
nnoremap <silent> <Space><Space> :<C-u>source ~/.vimrc<CR>
nnoremap <silent> <Space>o :only<CR>

" unite
nnoremap <silent> :uf :<C-u>Unite -buffer-name=files file file/new<CR>
nnoremap <silent> :ub :<C-u>Unite buffer<CR>
nnoremap <silent> :ua :<C-u>Unite -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> :us :<C-u>Unite snippet<CR>

" vim shell
nnoremap <silent> :vs :<C-u>VimShell<CR>
nnoremap <silent> <Space>r <d-r>


" neocomplcache setting
"----------------------------------------
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_auto_completion_start_length = 3
let g:neocomplcache_min_keyword_length = 4
let g:neocomplcache_enable_ignore_case = 0
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_enable_camel_case_completion = 0 
let g:neocomplcache_snippets_dir    = $VIM_ROOT.'/snippets'
let g:neosnippet#snippets_directory = $VIM_ROOT.'/snippets'
" let g:neocomplcache_force_overwrite_completefunc = 1
let g:neocomplcache_skip_auto_completion_time = '0.3'


" neosnippet setting
"----------------------------------------
nnoremap <silent> :ns :NeoSnippetEdit<CR>

imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
imap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ?  "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ?  "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

if has('conceal')
  set conceallevel=2 concealcursor=i
endif


" lightline setting
" --------------------------------------
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))'
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

" highlight focused
" ---------------------------------------
augroup cch
    autocmd! cch
    autocmd WinLeave * set nocursorcolumn nocursorline
    autocmd WinEnter,BufRead * set cursorcolumn cursorline
augroup END

" indent setting
" --------------------------------------

augroup TabSize
    autocmd! TabSize
    autocmd BufNew,BufRead,WinEnter *.zshrc  setlocal ts=2 sw=2 sts=2
    autocmd BufNew,BufRead,WinEnter *.rb     setlocal ts=2 sw=2 sts=2
    autocmd BufNew,BufRead,WinEnter *.erb    setlocal ts=2 sw=2 sts=2
    autocmd BufNew,BufRead,WinEnter *.html   setlocal ts=2 sw=2 sts=2
    autocmd BufNew,BufRead,WinEnter *.java   setlocal ts=4 sw=4 sts=4
    autocmd BufNew,BufRead,WinEnter *.js     setlocal ts=4 sw=4 sts=4
    autocmd BufNew,BufRead,WinEnter *.ejs    setlocal ts=2 sw=2 sts=2 filetype=html
    autocmd BufNew,BufRead,WinEnter *.coffee setlocal ts=2 sw=2 sts=2
    autocmd BufNew,BufRead,WinEnter *.pl     setlocal ts=4 sw=4 sts=4
augroup END




