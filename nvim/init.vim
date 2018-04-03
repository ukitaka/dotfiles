if &compatible
  set nocompatible
endif

set runtimepath+=~/dotfiles/nvim/dein.vim/repos/github.com/Shougo/dein.vim

if dein#load_state('~/dotfiles/nvim/dein.vim')
  call dein#begin('~/dotfiles/nvim/dein.vim')

  call dein#add('~/dotfiles/nvim/dein.vim/repos/github.com/Shougo/dein.vim')

  call dein#add('Shougo/denite.nvim')
  call dein#add('Shougo/neomru.vim')
  call dein#add('w0ng/vim-hybrid')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable
colorscheme hybrid

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

" denite
" ------------------------------------
nnoremap <silent> :uf :<C-u>Denite -buffer-name=files file<CR>
nnoremap <silent> :ua :<C-u>Denite -buffer-name=files buffer file_mru file<CR>

call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', '<C-q>', '<denite:quit>', 'noremap')

" vim-airline
" ----------------------------------
let g:airline_theme='molokai'
