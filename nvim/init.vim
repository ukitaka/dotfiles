if &compatible
  set nocompatible
endif

set runtimepath+=~/dotfiles/nvim/dein.vim/repos/github.com/Shougo/dein.vim
let s:dein_dir = "~/dotfiles/nvim/dein.vim"
let s:toml_dir = "~/dotfiles/nvim/toml"

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#add(s:dein_dir . '/repos/github.com/Shougo/dein.vim')
  call dein#load_toml(s:toml_dir . '/default.toml', {'lazy': 0})
  call dein#load_toml(s:toml_dir . '/lazy_default.toml', {'lazy': 1})
  call dein#load_toml(s:toml_dir . '/swift.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" color
" ------------------------------------
set background=dark
colorscheme hybrid

" general
" ------------------------------------
set cindent
set expandtab
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
set shiftwidth=2
set tabstop=2
set laststatus=2
set autowrite
set cursorcolumn

" key-mapping
" ------------------------------------
imap <C-j> <esc>
vmap <C-j> <esc>
imap <C-f> <right>
imap <C-b> <left>
imap <C-a> <Home>
map == ==<CR>
nnoremap <silent> <Space><Space> :<C-u>source ~/dotfiles/nvim/init.vim<CR>
nnoremap <silent> <Space>o :only<CR>

" vim-airline
" ------------------------------------
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 0

" tab
" ------------------------------------
noremap    [Tag] <Nop> 
nmap    <Space> [Tag]
for n in range(1, 9)
    execute 'nnoremap <silent> [Tag]'.n ':<C-u>tabnext'.n.'<CR>'
endfor

map <silent> [Tag]c :tablast <bar> tabnew<CR>
map <silent> [Tag]x :tabclose<CR> 
map <silent> [Tag]n :tabnext<CR>
map <silent> [Tag]p :tabprevious<CR>
nnoremap <silent> <Space>o :only<CR>

" caw setting
" ------------------------------------
nmap <C-i> <Plug>(caw:hatpos:toggle)
vmap <C-i> <Plug>(caw:hatpos:toggle)

" indent setting
" --------------------------------------

augroup TabSize
    autocmd! TabSize
    " Ruby
    autocmd BufNew,BufRead,WinEnter *.zshrc  setlocal ts=2 sw=2 sts=2
    autocmd BufNew,BufRead,WinEnter *.rb     setlocal ts=2 sw=2 sts=2
    autocmd BufNew,BufRead,WinEnter *.erb    setlocal ts=2 sw=2 sts=2
    autocmd BufNew,BufRead,WinEnter Rakefile setlocal ts=2 sw=2 sts=2 filetype=ruby
    autocmd BufNew,BufRead,WinEnter Gemfile  setlocal ts=2 sw=2 sts=2 filetype=ruby
    " Perl
    autocmd BufNew,BufRead,WinEnter *.pl     setlocal ts=4 sw=4 sts=4
    autocmd BufNew,BufRead,WinEnter *.pm     setlocal ts=4 sw=4 sts=4 filetype=perl
    autocmd BufNew,BufRead,WinEnter *.psgi   setlocal ts=4 sw=4 sts=4 filetype=perl
    autocmd BufNew,BufRead,WinEnter *.t      setlocal ts=4 sw=4 sts=4 filetype=perl
    autocmd BufNew,BufRead,WinEnter *.tt     setlocal ts=2 sw=2 sts=2 filetype=tt2
    " iOS
    autocmd BufNew,BufRead,WinEnter Podfile  setlocal ts=2 sw=2 sts=2 filetype=ruby
    " binary
    autocmd BufNew,BufRead,WinEnter *.o      :Vinarise
augroup END

" autosave setting
" ------------------------------------
let g:auto_write = 1

" yank setting
" -------------------------------------
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
let g:yankround_max_history = 50
nnoremap <silent>g<C-p> :<C-u>CtrlPYankRound<CR>
nnoremap <silent>g<C-p> :<C-u>CtrlPYankRound<CR>

