set nocompatible
filetype plugin indent on
set encoding=utf8
set nowrap
set undolevels=100
set number
set hlsearch
set scrolloff=1
set sidescrolloff=5
let mapleader="\<SPACE>"

let g:dispatch_compilers={}
let g:dispatch_compilers['npm run lint']='tslint'

" Minpac Package Manager
packadd minpac
call minpac#init()
call minpac#add('tpope/vim-unimpaired')
call minpac#add('junegunn/fzf')
call minpac#add('tpope/vim-scriptease',{'type':'opt'})
call minpac#add('k-takata/minpac',{'type': 'opt'})
call minpac#add('junegunn/fzf.vim')
call minpac#add('tpope/vim-projectionist')
call minpac#add('tpope/vim-dispatch')
call minpac#add('w0rp/ale')
call minpac#add('mhinz/vim-grepper')
call minpac#add('janko-m/vim-test')
call minpac#add('tpope/vim-obsession')

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

" For Javascript files use eslint
let g:ale_linters={
\ 'javascript': ['eslint'],
\ }

" cabbrev grep GrepperGrep
function! SetupCommandAlias(input, output)
	exec 'cabbrev <expr> '.a:input
	  \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:input.'")'
	  \ .'? ("'.a:output.'") : ("'.a:input.'"))'
endfunction
call SetupCommandAlias("grep", "GrepperGrep")

nnoremap <Leader>g :Grepper -tool git<CR>
nnoremap <Leader>G :Grepper -tool rg<CR>

let g:grepper = {}
let g:grepper.tools = ['grep','git','rg']
" Search for the current word
nnoremap <Leader>* :Grepper -cword -noprompt<CR>

" Test strategy
let test#strategy = "dispatch"

" Search for the current selection
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

" FZF CONFIG
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})
nnoremap <C-p> :<C-u>FZF<CR>

" Mappings in the style of unimpaired-next

nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)

" Window switching 
nnoremap <M-h> <c-w>h
nnoremap <M-j> <c-w>j
nnoremap <M-k> <c-w>k
nnoremap <M-l> <c-w>l
" NVIM Configs
if has('nvim')
tnoremap <Esc> <C-\><C-n>
tnoremap <C-v><Esc> <Esc>
highlight! link TermCursor Cursor
highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
" Window switching from terminal
tnoremap <M-h> <c-\><c-n><c-w>h
tnoremap <M-j> <c-\><c-n><c-w>j
tnoremap <M-k> <c-\><c-n><c-w>k
tnoremap <M-l> <c-\><c-n><c-w>l
endif

"if has('nvim') && executable('nvr')
"let $VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
"endif
