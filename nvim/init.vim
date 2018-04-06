if &compatible
  set nocompatible
endif

set runtimepath+=~/dotfiles/nvim/dein.vim/repos/github.com/Shougo/dein.vim

if dein#load_state('~/dotfiles/nvim/dein.vim')
  call dein#begin('~/dotfiles/nvim/dein.vim')

  call dein#add('~/dotfiles/nvim/dein.vim/repos/github.com/Shougo/dein.vim')

  call dein#add('Shougo/denite.nvim')
  call dein#add('Shougo/deoplete.nvim')
  " call dein#add('Shougo/deol.nvim')
  call dein#add('Shougo/neomru.vim')
  call dein#add('Shougo/vinarise')
  call dein#add('w0ng/vim-hybrid')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('thinca/vim-quickrun')
  call dein#add('tpope/vim-fugitive')
  call dein#add('w0rp/ale')
  call dein#add('tyru/caw.vim')
  call dein#add('rhysd/committia.vim')
  call dein#add('syui/wauto.vim')
  call dein#add('syui/wauto.vim')
  call dein#add('LeafCage/yankround.vim')
  call dein#add('landaire/deoplete-swift')
  call dein#add('kballard/vim-swift')
  call dein#add('keith/swift.vim')
  call dein#add('vim-perl/vim-perl')

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
    " iOS
    autocmd BufNew,BufRead,WinEnter Podfile  setlocal ts=2 sw=2 sts=2 filetype=ruby
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

