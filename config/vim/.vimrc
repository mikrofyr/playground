set number
syntax on
set viminfo='10,\"100,:20,%,n~/.viminfo

function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END


map <F5> :tabp<Enter>
map <F6> :tabn<Enter>
"map <C-t> :tabe<Space>
map <C-f> :tag <C-R><C-W><Enter>

hi comment ctermfg=blue

set tags=tags;

"set autoindent
set nowrap
set expandtab
set tabstop=2
set shiftwidth=2
set hlsearch
set ignorecase
set ts=2
set enc=utf8
autocmd filetype tex set wrap
autocmd filetype cobol set syntax=off
autocmd FileType make setlocal noexpandtab


