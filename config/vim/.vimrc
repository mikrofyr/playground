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


"map <F5> :tabp<Enter>
"map <F6> :tabn<Enter>
"map <C-n> :tabp<Enter>
"map <C-m> :tabn<Enter>
nnoremap <C-e> <C-w>
map <C-t> :tabe<Enter>
map <C-w> :tabc<Enter>
map <C-f> :tag <C-R><C-W><Enter>
map <C-k> :Tcd %:p:h<Enter>
map <C-j> :Tcd ${PWD}<Enter>
"map <C-l> :sh<Enter>
map <C-l> :! bash<Enter><CR>


hi comment ctermfg=blue

set tags=tags;
set incsearch
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
colorscheme monokai
"imap <C-Return> <CR><CR><C-o>k<Tab>

set pastetoggle=<F3>
"set invnumber=<F5>
"map: <F4> set invnumber
set background=dark

" Allow multiple indent
vnoremap < <gv
vnoremap > >gv

set backspace=indent,eol,start

" --------------------------------------
" --           ctrlp                  --
" --------------------------------------
set runtimepath^=~/.vim/bundle/ctrlp.vim

" -- Filtering
" XXX: These won't take effect with ag, see ~/.agignore
" Symlinks are slow
let g:ctrlp_follow_symlinks = 1 
"let g:ctrlp_custom_ignore = {
"  \ 'dir':  '\v[\/]\.(externals|git|doc|sim)$',
"  \ 'file': '\v\.(docx|vsdx|log|comp|args|sim|DoConfig|IpJobs.sh)$',
"  \ 'link': 'some_bad_symbolic_links',
"  \ }

" -- Caching and search settings
let g:ctrlp_max_height = 20
let g:ctrlp_clear_cache_on_exit = 0
"let g:ctrlp_by_filename = 1
let g:ctrlp_regexp = 1
" root markers does not work if cwd contains .svn or .git
"let g:ctrlp_working_path_mode = "r"
let g:ctrlp_working_path_mode = 0
let g:ctrlp_root_markers = ['.dogitworkspace']
let g:ctrlp_show_hidden = 1

" -- Speed up search with ag, https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore~veen/.agignore
  "let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  "let g:ctrlp_user_command = 'ag %s -f --hidden -p ~/.agignore --nocolor -g ""'
  let g:ctrlp_user_command = 'ag %s -f -l --hidden --path-to-ignore ~/.agignore --nocolor -g ""'
endif

" --------------------------------------
" --           NERDTree              --
" --------------------------------------
set runtimepath^=~/.vim/bundle/nerdtree
nmap <silent> <C-B> :NERDTreeToggle<CR>
let g:NERDTreeWinSize=50
if !empty($NERDTREE_BOOKMARKS)
    if filereadable($NERDTREE_BOOKMARKS)
        let g:NERDTreeBookmarksFile = $NERDTREE_BOOKMARKS
    endif
endif

" Improved block selection
set nosol

" Automatic chdir (shared across tabs :/)
"set autochdir


" --------------------------------------
" --              tcd                 --
" --------------------------------------
set runtimepath^=~/.vim/bundle/tcd.vim

" --------------------------------------
" --            tabline               --
" --------------------------------------
set runtimepath^=~/.vim/bundle/tabline.vim

" -- Paste issues
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
" --------------------------------------
" --            macros           --
" --------------------------------------
" RTL instantiation
let @m = 't,vBy0i.^C^Cpi<80>kr(),^C^C<80>krv/,^M"_d?(^Mp'
let @s = '^C^C:%s/\s\+$//e^M'
" Uncomment '//'
let @b = ':s/\/\///e^M'
" Comment '//' 
let @v = '0i//^C^C'
" wiki TODO
let @a='0I<todo>^C^C$A</todo> \\^C^C'
