" Movement controls
imap <C-p> <Up>
imap <C-n> <Down>
imap <C-b> <Left>
imap <M-b> <C-Left>
imap <C-f> <Right>
imap <M-f> <C-Right>
imap <C-a> <Esc>^i
imap <C-e> <End>
imap <C-v> <Esc><C-d>i
imap <M-v> <Esc><C-u>i

" Split Navigation
nnoremap <C-p> <C-w>k
nnoremap <C-n> <C-w>j
nnoremap <C-b> <C-w>h
nnoremap <C-f> <C-w>l

" Deletion
imap <C-d> <Del>
imap <M-d> <C-Del>
imap <C-h> <BS>
imap <C-k> <Esc>:call KillAfter()<CR>a
imap <C-k><Backspace> <Esc><C-v>^di

function! KillAfter()
  let col = col('.')
  let line = line('.')
  if col == 1
    call setline(line, '')
  else
    call setline(line, getline(line)[: col - 1])
  endif
endfunction

set timeoutlen=250

" Pasting
imap <C-y> <Esc>"*pa

" File Jumping
map <C-x><C-f> <Esc>:GFiles<CR>

" File Management
imap <C-x><C-s> <Esc>:w<CR>a

" Exiting emacs!!! :gasp:
nnoremap <C-c> :qa<CR>
inoremap <C-x><C-c> <Esc>:qa<CR>

set number

" Netrw sidebar

" let g:netrw_banner = 0
" let g:netrw_liststyle = 3
" let g:netrw_browse_split = 4
" let g:netrw_altv = 1
" let g:netrw_winsize = 20

" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Vexplore
" augroup END

" Plugins

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
call plug#end()

colorscheme gruvbox

" Coc prettier

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" NerdTree sidebar

let g:NERDTreeWinSize = 20

autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

autocmd BufWinEnter * silent NERDTreeMirror

let NERDTreeQuitOnOpen=0
