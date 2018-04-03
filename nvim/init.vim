if &compatible
  set nocompatible
endif

set runtimepath+=~/dotfiles/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/dotfiles/.vim/dein')
  call dein#begin('~/dotfiles/.vim/dein')

  call dein#add('~/dotfiles/.vim/dein/repos/github.com/Shougo/dein.vim')

  call dein#add('Shougo/denite.nvim')
  call dein#add('Shougo/neomru.vim')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

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

" unite
" ------------------------------------
nnoremap <silent> :uf :<C-u>Denite -buffer-name=files file<CR>
nnoremap <silent> :ua :<C-u>Denite -buffer-name=files buffer file_mru file<CR>

