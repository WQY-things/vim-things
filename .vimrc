"set runtimepath=/home/wangqingyi/.vim/,/home/wangqingyi/.vim/after,/usr/share/vim/.vim,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vim74,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,/usr/share/vim/.vim/after
"set rtp+=/home/wangqingyi/.vim/,/home/wangqingyi/.vim/after
set runtimepath=/usr/share/vim/.vim,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vim80,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,/usr/share/vim/.vim/after
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
Plugin 'godlygeek/tabular'
"Plugin 'preservim/nerdtree'
"Plugin 'xuyuanp/nerdtree-git-plugin'

"Jeffy Du plugin
Plugin 'ZoomWin'
Plugin 'taglist.vim'
Plugin 'ervandew/supertab'
Plugin 'msanders/snipmate.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'yegappan/mru'
Plugin 'lookupfile'
Plugin 'GetLatestVimScripts'
Plugin 'genutils'
Plugin 'mbbill/echofunc'
Plugin 'bufexplorer.zip'
Plugin 'AutoComplPop'

call vundle#end()
filetype plugin indent on
syntax on

" Setting colorscheme
" color mycolor
" Other settings.
set   autoindent
set   autoread
set   autowrite
set   background=dark
set   backspace=indent,eol,start
set nobackup
set   cindent
set   cinoptions=:0
set   cursorline
set   completeopt=longest,menuone
set noexpandtab
set   fileencodings=utf-8,gb2312,gbk,gb18030
set   fileformat=unix
set   foldenable
set   foldmethod=marker
set   guioptions-=T
set   guioptions-=m
set   guioptions-=r
set   guioptions-=l
set   helpheight=10
set   helplang=cn
set   hidden
set   history=100
set   hlsearch
set   ignorecase
set   incsearch
set   laststatus=2
set   mouse=a
set   number
set   pumheight=10
set   ruler
set   scrolloff=5
set   shiftwidth=4
set   showcmd
set   smartindent
set   smartcase
set   tabstop=4
set   termencoding=utf-8
set   textwidth=80
set   whichwrap=h,l
set   wildignore=*.bak,*.o,*.e,*~
set   wildmenu
set   wildmode=list:longest,full
set nowrap

" AUTO COMMANDS: {{{1
" auto expand tab to blanks
"autocmd FileType c,cpp set expandtab
" Restore the last quit position when open file.
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \     exe "normal g'\"" |
    \ endif

" SHORTCUT SETTINGS: {{{1
" Set mapleader
let mapleader=","
" Space to command mode.
nnoremap <space> :
vnoremap <space> :
" Switching between buffers.
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
inoremap <C-h> <Esc><C-W>h
inoremap <C-j> <Esc><C-W>j
inoremap <C-k> <Esc><C-W>k
inoremap <C-l> <Esc><C-W>l
" "cd" to change to open directory.
let OpenDir=system("pwd")
nmap <silent> <leader>cd :exe 'cd ' . OpenDir<cr>:pwd<cr>

" PLUGIN SETTINGS: {{{1
" taglist.vim
let g:Tlist_Auto_Update=1
let g:Tlist_Process_File_Always=1
let g:Tlist_Exit_OnlyWindow=1
let g:Tlist_Show_One_File=1
let g:Tlist_WinWidth=25
let g:Tlist_Enable_Fold_Column=0
let g:Tlist_Auto_Highlight_Tag=1
" NERDTree.vim
let g:NERDTreeWinPos="right"
let g:NERDTreeWinSize=25
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeQuitOnOpen=1
" cscope.vim
if has("cscope")
    set csto=1
    set cst
    set nocsverb
    if filereadable("cscope.out")
        cs add cscope.out
    endif
    set csverb
endif
" OmniCppComplete.vim
"set nocp 
"filetype plugin on 
let g:OmniCpp_DefaultNamespaces=["std"]
let g:OmniCpp_MayCompleteScope=1
let g:OmniCpp_SelectFirstItem=2

" VimGDB.vim
if has("gdb")
	set asm=0
	let g:vimgdb_debug_file=""
	run macros/gdb_mappings.vim
endif
" LookupFile setting
let g:LookupFile_TagExpr='"./tags.filename"'
let g:LookupFile_MinPatLength=2
let g:LookupFile_PreserveLastPattern=0
let g:LookupFile_PreservePatternHistory=1
let g:LookupFile_AlwaysAcceptFirst=1
let g:LookupFile_AllowNewFiles=0
" Man.vim
source $VIMRUNTIME/ftplugin/man.vim
" snipMate
"let g:snips_author="Du Jianfeng"
"let g:snips_email="cmdxiaoha@163.com"
"let g:snips_copyright="SicMicro, Inc"
" plugin shortcuts
function! RunShell(Msg, Shell)
	echo a:Msg . '...'
	call system(a:Shell)
	echon 'done'
endfunction
nmap  <F2> :TlistToggle<cr>
nmap  <F3> :NERDTreeToggle<CR>
nmap  <F4> :MRU<cr>
nmap  <F5> <Plug>LookupFile<cr>
nmap  <F6> :vimgrep /<C-R>=expand("<cword>")<cr>/ **/*.c **/*.h<cr><C-o>:cw<cr>
nmap  <F9> :call RunShell("Generate tags", "ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .")<cr>
nmap <F10> :call HLUDSync()<cr>
nmap <F11> :call RunShell("Generate filename tags", "~/.vim/shell/genfiletags.sh")<cr>
nmap <F12> :call RunShell("Generate cscope", "cscope -Rb")<cr>:cs add cscope.out<cr>
nmap <leader>sa :cs add cscope.out<cr>
nmap <leader>ss :cs find s <C-R>=expand("<cword>")<cr><cr>
nmap <leader>sg :cs find g <C-R>=expand("<cword>")<cr><cr>
nmap <leader>sc :cs find c <C-R>=expand("<cword>")<cr><cr>
nmap <leader>st :cs find t <C-R>=expand("<cword>")<cr><cr>
nmap <leader>se :cs find e <C-R>=expand("<cword>")<cr><cr>
nmap <leader>sf :cs find f <C-R>=expand("<cfile>")<cr><cr>
nmap <leader>si :cs find i <C-R>=expand("<cfile>")<cr><cr>
nmap <leader>sd :cs find d <C-R>=expand("<cword>")<cr><cr>
nmap <leader>zz <C-w>o
nmap <leader>gs :GetScripts<cr>

let Tlist_Show_One_File=0
set noswapfile
set tags+=/usr/include/tags
set tags+=/usr/src/tags
set tags+=~/.tags
set tags+=~/source/glibc-2.19/tags
set tags+=~/source/gcc-7.5.0/tags
map ta :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>



"==========================================================
"=================my personal configure====================
"==========================================================

"取消注释行回车自动形成注释行
set fo-=r

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
set expandtab
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
"set tags+=~/git_products_0/tags

"snipMate, deal suptab's tab key conflict
let g:SuperTabMappingForward="<c-space>"
let g:snippets_dir="~/.vim/snippets/"
let g:snips_author="WangQingyi"
let g:snips_email="wangqingyi@chemclin.com"
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
nmap <leader>ve :e $MYVIMRC<CR>
nmap <leader>vr :source $MYVIMRC<CR>
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
map te :tabe<CR>
map tp :tabp<CR>
map tn :tabn<CR>
"Close all other tab pages
map to :tabo<CR>

map bp :bp<CR>
map bn :bn<CR>

" map ta <nop>
"nmap <F9> <nop>
"nmap <F9> :call RunShell("Generate tags", "ctags -f ~/git_products_0/tags -R --c++-kinds=+p --fields=+iaS --extra=+q ~/git_products_0/")<cr>
"nmap <F12> <nop>
"nmap <F12> :call RunShell("Generate cscope", "cscope -Rb -f ~/git_products_0/cscope.out -P ~/git_products_0/")<cr>:cs add ~/git_products_0/cscope.out<cr>
nmap <leader>sa :cs add cscope.out<cr>

"Press <LEADER> twice to jump to the next '<++>' and edit it
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

"Press ` to change case (instead of ~)
map ` ~

"m is conflict with vim-man before
"map m <Esc>:mark 

autocmd BufNewFile,BufRead *.log set filetype=mylog

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

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

" ===
" === acp
" ===
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
augroup complete
	autocmd!
	autocmd CompleteDone * pclose
augroup end

" ===
" === auto-pairs
" ===
let g:AutoPairsShortcutJump = '<leader>n'
let g:AutoPairsShortcutFastWrap = '<leader>e'
