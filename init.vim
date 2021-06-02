" Movement controls
imap <C-p> <Up>
imap <C-n> <Down>
imap <C-b> <Left>
imap <M-b> <C-Left>
imap <C-f> <Right>
imap <M-f> <C-Right>
imap <C-a> <C-o>:call <SID>home()<CR>
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
imap <C-k> <C-r>=<SID>kill()<CR>

" Pasting
imap <C-y> <Esc>"*pa

" File Jumping
map <C-x><C-f> <Esc>:GFiles<CR>
map <C-x><C-F> <Esc>:Files<CR>

" File Management
imap <C-x><C-s> <Esc>:w<CR>a

" Exiting emacs!!! :gasp:
nnoremap <C-c> :qa<CR>
inoremap <C-x><C-c> <Esc>:qa<CR>

set number

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
augroup END

function! s:home()
  let start_column = col('.')
  normal! ^
  if col('.') == start_column
    normal! 0
  endif
  return ''
endfunction

function! s:kill()
  let [text_before, text_after] = s:split_line()
  if len(text_after) == 0
    normal! J
  else
    call setline(line('.'), text_before)
  endif
  return ''
endfunction

function! s:split_line()
  let line_text = getline(line('.'))
  let text_after  = line_text[col('.')-1 :]
  let text_before = (col('.') > 1) ? line_text[: col('.')-2] : ''
  return [text_before, text_after]
endfunction

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
call plug#end()

colorscheme gruvbox
