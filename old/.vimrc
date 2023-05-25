"set runtimepath=/home/wangqingyi/.vim/,/home/wangqingyi/.vim/after,/usr/share/vim/.vim,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vim74,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,/usr/share/vim/.vim/after
"set rtp+=/home/wangqingyi/.vim/,/home/wangqingyi/.vim/after
set rtp+=$HOME/.vim/,$HOME/.vim/after

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'connorholyday/vim-snazzy'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'
"Plugin 'preservim/nerdtree'
"Plugin 'xuyuanp/nerdtree-git-plugin'

call vundle#end()
filetype plugin indent on
syntax on

set mouse=

set autoindent
set cindent
set tabstop=4
set shiftwidth=4
set nu
set hls
set nois

"study from theCW
"filetype on
"filetype indent on
"filetype plugin on
"终端配色问题
let &t_ut='i'
set list
"set listchars=tab:▸\ ,trail:▫
set listchars=tab:▶\ ,trail:□
" set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set scrolloff=5
set tw=0
set indentexpr=
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
"let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"let &t_SR = "\<Esc>]50;CursorShape=2\x7"
"let &t_EI = "\<Esc>]50;CursorShape=0\x7"
if &term =~ "xterm"
"	let &t_SI = "\<Esc>[6 q" . "\<Esc\>]12;\x7"
"	let &t_SR = "\<Esc>[3 q" . "\<Esc\>]12;\x7"
"	let &t_EI = "\<Esc>[2 q" . "\<Esc\>]12;\x7"
	let &t_SI = "\<Esc>[5 q"
	let &t_SR = "\<Esc>[3 q"
	let &t_EI = "\<Esc>[2 q"
endif
" 1 -> blinking block  闪烁的方块
" 2 -> solid block  不闪烁的方块
" 3 -> blinking underscore  闪烁的下划线
" 4 -> solid underscore  不闪烁的下划线
" 5 -> blinking vertical bar  闪烁的竖线
" 6 -> solid vertical bar  不闪烁的竖线

set laststatus=2
set autochdir
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | end

set number
set relativenumber
set cursorline
set cursorcolumn
set wrap
set showcmd
set wildmenu


set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase

"vimdiff
set diffopt+=iwhite

"tags
" set tags+=~/git_products_0/app/tags
" set tags+=~/git_products_0/lib/tags
set tags+=~/git_products_0/tags

"snipMate, deal suptab's tab key conflict
let g:SuperTabMappingForward="<c-space>"
let g:snippets_dir="~/.vim/snippets/"
let g:snips_author="Wangqingyi"
let g:snips_email="qywang@cloudpick.me"
let g:snips_copyright="CloudPick, Inc"

" cscope.vim
if has("cscope")
    set csto=1
    set cst
    set nocsverb
    if filereadable("~/git_products_0/cscope.out")
        cscope add ~/git_products_0/cscope.out
    endif
    set csverb
endif

" vim-man
nmap M :Man <C-R>=expand("<cword>")<CR><CR>

noremap H 7h
noremap L 7l
noremap J 5j
noremap K 5k
noremap n nzz
noremap N Nzz

"map [[ ?{<CR>w99[{
"map ][ /}<CR>b99]}
"map ]] j0[[%/{<CR>
"map [] k$][%?}<CR>

noremap <LEADER><CR> :nohlsearch<CR>

map s <nop>
map S :w<CR>
map Q :q<CR>
map <leader>vm :source $MYVIMRC<CR>
map <space> :
"map ; :

map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sj :set splitbelow<CR>:split<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K

map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-j> <C-w>j
map <C-k> <C-w>k

map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize -5<CR>
map <right> :vertical resize +5<CR>

"tab
map tu :tabe<CR>
map th :tabp<CR>
map tl :tabn<CR>
"Close all other tab pages
map tc :tabo<CR>

map ta <nop>
nmap <F9> <nop>
nmap <F9> :call RunShell("Generate tags", "ctags -f ~/git_products_0/tags -R --c++-kinds=+p --fields=+iaS --extra=+q ~/git_products_0/")<cr>
nmap <F12> <nop>
nmap <F12> :call RunShell("Generate cscope", "cscope -Rb -f ~/git_products_0/cscope.out -P ~/git_products_0/")<cr>:cs add ~/git_products_0/cscope.out<cr>
nmap <leader>sa :cs add cscope.out<cr>

"Press <LEADER> twice to jump to the next '<++>' and edit it
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

"Press ` to change case (instead of ~)
map ` ~

"m is conflict with vim-man before
"map m <Esc>:mark 

" ===
" === snazzy
" ===
let g:SnazzyTransparent = 1
" color snazzy

" ===
" === airline
" ===
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#formatter = 'default'
" let g:airline_left_sep = '▶'
" let g:airline_left_alt_sep = '❯'
" let g:airline_right_sep = '◀'
" let g:airline_right_alt_sep = '❮'

" ===
" === airline-themes
" ===
"let g:airline_theme='bubblegum'
let g:airline_theme='dark'

" ===
" === Tabular
" ===
vmap <LEADER>= :Tab /=<CR>
vmap <LEADER>, :Tab /,<CR>

" ===
" === NERD_commenter
" ===
let g:NERDSpaceDelims = 1

" ===
" === NERD_tree
" ===
"let NERDTreeIgnore = ['\.o$']


" ===
" === lookupfile
" ===
let g:LookupFile_TagExpr='"/home/wangqingyi/git_products_0/tags.fn"'

" ===
" === gitgutter
" ===
set updatetime=100
nmap ]c <Plug>(GitGutterNextHunk)
nmap [c <Plug>(GitGutterPrevHunk)

" ===
" === nerdtree-git-plugin
" ===
"let g:NERDTreeGitStatusIndicatorMapCustom = {
"                \ 'Modified'  :'✹',
"                \ 'Staged'    :'✚',
"                \ 'Untracked' :'✭',
"                \ 'Renamed'   :'➜',
"                \ 'Unmerged'  :'═',
"                \ 'Deleted'   :'✖',
"                \ 'Dirty'     :'✗',
"                \ 'Ignored'   :'☒',
"                \ 'Clean'     :'✔︎',
"                \ 'Unknown'   :'?',
"                \ }
"let g:NERDTreeGitStatusUseNerdFonts = 1
"let g:NERDTreeGitStatusUntrackedFilesMode = 'all'
"let g:NERDTreeGitStatusShowClean = 1
