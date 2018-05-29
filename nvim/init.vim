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

  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

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

" terminal
" ------------------------------------
nnoremap <silent> :ut :<C-u>Deol -split <CR>
tnoremap <silent> :ut <C-\><C-n>:q<CR>

autocmd FileType help nnoremap <buffer> q <C-w>c

" denite
" ------------------------------------
nnoremap <silent> :uf :<C-u>Denite -buffer-name=files -mode=normal -direction=dynamictop file<CR>
nnoremap <silent> :ur :<C-u>Denite -buffer-name=files -mode=insert -direction=dynamictop file_rec<CR>
nnoremap <silent> :ug :<C-u>DeniteCursorWord -buffer-name=files -mode=insert -direction=dynamictop grep<CR>
nnoremap <silent> :ua :<C-u>Denite -buffer-name=files buffer -mode=normal -direction=dynamictop file_mru file<CR>
nnoremap <silent> :ub :<C-u>Denite -buffer-name=files buffer -mode=normal -direction=dynamictop buffer<CR>
nnoremap <silent> :uo :<C-u>Denite -buffer-name=files buffer -mode=normal -direction=dynamictop outline<CR>

call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', '<C-q>', '<denite:quit>', 'noremap')

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

" deoplete
" ------------------------------------
let g:deoplete#enable_at_startup = 1

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

