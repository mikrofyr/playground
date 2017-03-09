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

set autoindent
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


" copy and paste
" vmap <C-c> "+yi
" vmap <C-x> "+c
" vmap <C-v> c<ESC>"+p
" imap <C-v> <ESC>"+pa

" Coloring
"colo darkblue
"colo elflord
"colo shine
"

"imap <C-Return> <CR><CR><C-o>k<Tab>

set pastetoggle=<F3>
"set invnumber=<F5>
"map: <F4> set invnumber
set background=dark

" Allow multiple indent
vnoremap < <gv
vnoremap > >gv

set backspace=indent,eol,start

"ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim

let g:ctrlp_follow_symlinks = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_by_filename = 1
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(externals|git|doc|sim)$',
  \ 'file': '\v\.(docx|vsdx|log|comp|args|sim|DoConfig|IpJobs.sh)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

"let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

