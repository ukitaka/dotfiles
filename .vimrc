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
    set runtimepath+=$VIM_ROOT/bundle/neobundle.vim/
endif

call neobundle#begin(expand($VIM_ROOT.'/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'
set termencoding=utf-8
set encoding=utf-8
set fenc=utf-8

" plugin
" --------------------------------------

NeoBundle 'Shougo/vimproc', {'build' : {'mac' : 'make -f make_mac.mak', 'unix' : 'make -f make_unix.mak'} }
NeoBundle 'Shougo/vimshell', {'depends' : 'Shougo/vimproc' }
NeoBundle 'Shougo/vinarise'
NeoBundle 'neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle "Shougo/neosnippet-snippets"
NeoBundle 'unite.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'LeafCage/yankround.vim'
NeoBundle 'syui/wauto.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'
NeoBundle 'thinca/vim-localrc'
NeoBundle "tyru/caw.vim"
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'rhysd/committia.vim'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'derekwyatt/vim-sbt'
NeoBundle 'b1narykid/llvm.vim'
NeoBundle 'zchee/vim-swift-syntax'
NeoBundle 'GEverding/vim-hocon'
NeoBundle 'rust-lang/rust.vim'

NeoBundleLazy 'alpaca-tc/alpaca_tags', {
            \    'depends': ['Shougo/vimproc'],
            \    'autoload' : {
            \       'commands' : [
            \          { 'name' : 'AlpacaTagsBundle', 'complete': 'customlist,alpaca_tags#complete_source' },
            \          { 'name' : 'AlpacaTagsUpdate', 'complete': 'customlist,alpaca_tags#complete_source' },
            \          'AlpacaTagsSet', 'AlpacaTagsCleanCache', 'AlpacaTagsEnable', 'AlpacaTagsDisable', 'AlpacaTagsKillProcess', 'AlpacaTagsProcessStatus',
            \       ],
            \    }
            \ }

call neobundle#end()

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
set background=dark
colorscheme hybrid


" key-mapping
" ------------------------------------
imap <C-j> <esc>
vmap <C-j> <esc>
imap <C-f> <right>
imap <C-b> <left>
imap <C-a> <Home>
map == ==<CR>

nnoremap <silent> <Space><Space> :<C-u>source ~/.vimrc<CR>
nnoremap <silent> <Space>o :only<CR>

" unite
" ------------------------------------
nnoremap <silent> :uf :<C-u>Unite -buffer-name=files file file/new<CR>
nnoremap <silent> :ub :<C-u>Unite buffer<CR>
nnoremap <silent> :ua :<C-u>Unite -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> :us :<C-u>Unite snippet<CR>
nnoremap <silent> :urc :<C-u>Unite rails/controller<CR>
nnoremap <silent> :urm :<C-u>Unite rails/model<CR>
nnoremap <silent> :urv :<C-u>Unite rails/view<CR>
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
    autocmd BufNew,BufRead,WinEnter Podfile  setlocal ts=2 sw=2 sts=2 filetype=ruby
    autocmd BufNew,BufRead,WinEnter Gemfile  setlocal ts=2 sw=2 sts=2 filetype=ruby
    autocmd BufNew,BufRead,WinEnter Rakefile setlocal ts=2 sw=2 sts=2 filetype=ruby
    autocmd BufNew,BufRead,WinEnter *.erb    setlocal ts=2 sw=2 sts=2
    autocmd BufNew,BufRead,WinEnter *.html   setlocal ts=2 sw=2 sts=2
    autocmd BufNew,BufRead,WinEnter *.java   setlocal ts=4 sw=4 sts=4
    autocmd BufNew,BufRead,WinEnter *.js     setlocal ts=4 sw=4 sts=4
    autocmd BufNew,BufRead,WinEnter *.ejs    setlocal ts=2 sw=2 sts=2 filetype=html
    autocmd BufNew,BufRead,WinEnter *.coffee setlocal ts=2 sw=2 sts=2
    autocmd BufNew,BufRead,WinEnter *.pl     setlocal ts=4 sw=4 sts=4
    autocmd BufNew,BufRead,WinEnter *.pm     setlocal ts=4 sw=4 sts=4 filetype=perl
    autocmd BufNew,BufRead,WinEnter *.psgi   setlocal ts=4 sw=4 sts=4 filetype=perl
    autocmd BufNew,BufRead,WinEnter *.t      setlocal ts=4 sw=4 sts=4 filetype=perl
    autocmd BufNew,BufRead,WinEnter *.gradle setlocal ts=4 sw=4 sts=4 filetype=groovy
    autocmd BufNew,BufRead,WinEnter *.yml    setlocal ts=2 sw=2 sts=2 filetype=yml
    autocmd BufNew,BufRead,WinEnter *.rabl   setlocal ts=2 sw=2 sts=2 filetype=ruby
    autocmd BufNew,BufRead,WinEnter *.conf   setlocal ts=2 sw=2 sts=2 filetype=hocon
augroup END

" tags
" ------------------------------------
let g:alpaca_tags#config = {
            \    '_' : '-R --sort=yes',
            \    'ruby': '--languages=+Ruby',
            \ }

augroup AlpacaTags
    autocmd!
    if exists(':AlpacaTags')
        autocmd BufWritePost   Gemfile  silent AlpacaTagsBundle
        autocmd BufWritePost   Podfile  silent AlpacaTagsBundle
        autocmd BufWritePost   Cpanfile silent AlpacaTagsBundle
        autocmd BufEnter     * silent AlpacaTagsSet
        autocmd BufWritePost * silent AlpacaTagsUpdate
    endif
augroup END

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


" Syntastic
" -----------------------------------
let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = ['perl', 'podchecker']
let g:syntastic_ignore_files = ['\m\.sbt$']

" caw setting
" ------------------------------------
nmap <C-i> <Plug>(caw:i:toggle)
vmap <C-i> <Plug>(caw:i:toggle)

" rails
" -----------------------------------
nmap :<C-u>rc :<C-u>Rcontroller
nmap :<C-u>rm :<C-u>Rmodel
nmap :<C-u>rv :<C-u>Rview

" tab setting
" ------------------------------------
function! s:SID_PREFIX()
    return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

function! s:my_tabline()  "{{{
    let s = ''
    for i in range(1, tabpagenr('$'))
        let bufnrs = tabpagebuflist(i)
        let bufnr = bufnrs[tabpagewinnr(i) - 1]
        let no = i 
        let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
        let title = fnamemodify(bufname(bufnr), ':t')
        let title = '[' . title . ']'
        let s .= '%'.i.'T'
        let s .= '%#' . (i == tabpagenr() ?  'TabLineSel' : 'TabLine') . '#'
        let s .= no . ':' . title
        let s .= mod
        let s .= '%#TabLineFill# '
    endfor
    let s .= '%#TabLineFill#%T%=%#TabLine#'
    return s
endfunction "}}}

let &tabline = '%!'.  s:SID_PREFIX() .  'my_tabline()'
set showtabline=2

noremap    [Tag] <Nop> 
nmap    <Space> [Tag]
for n in range(1, 9)
    execute 'nnoremap <silent> [Tag]'.n ':<C-u>tabnext'.n.'<CR>'
endfor

map <silent> [Tag]c :tablast <bar> tabnew<CR>
map <silent> [Tag]x :tabclose<CR> 
map <silent> [Tag]n :tabnext<CR>
map <silent> [Tag]p :tabprevious<CR>

" quickrun
let g:quickrun_config = { }
autocmd BufNewFile,BufRead *.crs setf rust
autocmd BufNewFile,BufRead *.rs  let g:quickrun_config.rust = {'exec' : 'cargo run'}
autocmd BufNewFile,BufRead *.crs let g:quickrun_config.rust = {'exec' : 'cargo script %s -- %a'}

