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

" color
" ------------------------------------
set background=dark
colorscheme hybrid

" general
" ------------------------------------
set paste
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
set shiftwidth=4
set tabstop=4
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
nnoremap <silent> :uf :<C-u>Denite -buffer-name=files -mode=normal file<CR>
nnoremap <silent> :ug :<C-u>DeniteCursorWord -buffer-name=files -mode=insert grep<CR>
nnoremap <silent> :ua :<C-u>Denite -buffer-name=files buffer -mode=normal file_mru file<CR>

call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', '<C-q>', '<denite:quit>', 'noremap')

" vim-airline
" ------------------------------------
let g:airline_theme='molokai'
let g:airline#extensions#tabline#enabled = 1

" tab
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

