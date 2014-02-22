scriptencoding utf-8

let $VIM_ROOT=$HOME.'/.vim'
set nocompatible

filetype off
filetype plugin indent off

" NeoBundle
" -------------------------------------
if has('vim_starting')
    if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
        echo "install neobundle..."
        :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
    endif
    set runtimepath+=~/.vim/bundle/neobundle.vim
endif

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
NeoBundle "Shougo/neosnippet-snippets"
NeoBundle 'unite.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'yuroyoro/yuroyoro256.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'yonchu/accelerated-smooth-scroll'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'LeafCage/yankround.vim'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'syui/wauto.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'mattn/gist-vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'tyru/open-browser.vim'


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
set autowrite


" color setting
" -----------------------------------
colorscheme yuroyoro256
"set t_Co=256
"set t_Sf=[3%dm
"set t_Sb=[4%dm
"hi PmenuSel cterm=reverse ctermfg=33 ctermbg=222 gui=reverse guifg=#3399ff guibg=#f0e68c


" key-mapping
" ------------------------------------
imap <C-j> <esc>
vmap <C-j> <esc>


nnoremap <silent> <Space><Space> :<C-u>source ~/.vimrc<CR>
nnoremap <silent> <Space>o :only<CR>

" unite
nnoremap <silent> :uf :<C-u>Unite -buffer-name=files file file/new<CR>
nnoremap <silent> :ub :<C-u>Unite buffer<CR>
nnoremap <silent> :ua :<C-u>Unite -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> :us :<C-u>Unite snippet<CR>
nnoremap <silent> <Space>r :<C-u>QuickRun -outputter/buffer/split ":botright"<CR>

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


" scroll setting
" --------------------------------------
let g:ac_smooth_scroll_du_sleep_time_msec = 1
let g:ac_smooth_scroll_fb_sleep_time_msec = 1 


" yank setting
" -------------------------------------
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
let g:yankround_max_history = 50
nnoremap <silent>g<C-p> :<C-u>CtrlPYankRound<CR>
nnoremap <silent>g<C-p> :<C-u>CtrlPYankRound<CR>


" autosave setting
" ------------------------------------
let g:auto_write = 1


" Markdown setting
" -----------------------------------
let g:quickrun_config = {}
let g:quickrun_config['markdown'] = {
            \ 'outputter': 'browser'
            \ }
