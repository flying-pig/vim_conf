" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
" Plugin 'brookhong/cscope.vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'elzr/vim-json'
Plugin 'majutsushi/tagbar'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'mbbill/code_complete'
Plugin 'fatih/vim-go'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" vundle setting end ----------------------------------------------------

" An example for a vimrc file.
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set ignorecase
set smartindent

set backupdir=~/.vim/backup
set backupext=.bak

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=ivh
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

set t_Co=256

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

set cindent
"set ic
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
"set cursorline
set tags+=tags
set tags+=/usr/include/tags
set nocp
filetype plugin indent on
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
colorscheme ron

let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

nnoremap <silent> <F2> :A<CR>

" auto complete
inoremap ( ()<ESC>i
"inoremap ) <ESC>la
inoremap ) <c-r>=ClosePair(')')<CR>


" function is OK, array, vector, json isn't
"inoremap { {<CR>}<ESC>0
inoremap { {}<ESC>i
inoremap } <c-r>=ClosePair('}')<CR>

inoremap [ []<ESC>i
inoremap ] <c-r>=ClosePair(']')<CR>

"inoremap ' ''<ESC>i
"inoremap " ""<ESC>i

function! ClosePair(char)
  if getline('.')[col('.') - 1] == a:char
    return "\<Right>"
  else
    return a:char
  endif
endfunction

" winManager setting
" let g:winManagerWindowLayout = "FileExplorer|TagList"
" let g:winManagerWindowLayout = "NERDTree|TagList"
let g:winManagerWidth = 30
function! NERDTree_Start()
    exe 'NERDTree'
endfunction

function! NERDTree_IsValid()
    return 1
endfunction

nmap wm :WMToggle<CR>
nmap <silent> mt :if IsWinManagerVisible() <BAR> WMToggle<CR> <BAR> else <BAR> WMToggle<CR>:q<CR> endif <CR> 

nmap co :copen<CR>
nmap cc :cclose<CR>
nmap cn :cnext<CR>
nmap cp :cprevious<CR>
" nmap tb :TbToggle<CR>
nmap tl :TlistToggle<CR>

" ctrlp settings
nnoremap ,b   :CtrlPBuffer<CR>
nnoremap ,p   :CtrlP<CR>
nnoremap ,,   :CtrlP<CR>

"tagbar settings
nmap <F8> :TagbarToggle<CR>
nmap tb :TagbarToggle<CR>


" Replace $RSENSE_HOME with the directory where RSense was installed
"let g:rsenseHome = "$RSENSE_HOME"
"let g:rsenseUseOmniFunc = 1

" NERDTREE
nnoremap <silent> <Leader>n  :NERDTreeToggle<CR>
let g:NERDTree_title='NERD Tree'
let NERDTreeIgnore = ['.*\.o$','.*\.ko$','.*\.gz$','.*\.so$','.*\.so\.*','.*\.a$','cscope\.*','.*_test','.*_bench']

set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gbk,gb18030,big5,euc-jp,euc-kr,latin1
set ambiwidth=double

" c-support
" autocmd BufRead,BufNewFile  *.xyz  set filetype=c
" let g:C_SourceCodeExtensions  = 'xyz c cc cp cxx cpp CPP c++ C i ii'
" let g:C_Styles = { '*.c,*.h' : 'C', '*.cc,*.cpp,*.c++,*.C,*.hh,*.h++,*.H' : 'CPP' }
set runtimepath^=~/.vim/bundle/cvim

" airline settings
set laststatus=2
let g:airline_section_warning=''
let g:airline_theme="powerlineish"
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'
" let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ''

" old vim-powerline symbols
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

" vim-markdown settings
"let g:vim_markdown_folding_disabled=1
let g:vim_markdown_initial_foldlevel=1
"let g:vim_markdown_no_default_key_mappings=1

" auto complete settings
" vim auto complete menu like normal IDE(VimTip128)
"set completeopt=longest,menu
" leave insert mode auto close preview window
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" press Enter select current item
inoremap <expr> <CR>	pumvisible() ? "\<C-y>" : "\<CR>"
" up|down|left|right key
inoremap <expr> <Up>	pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <Down>	pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <PageUp>	pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
inoremap <expr> <PageDown>	pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"

" YouCompleteMe settings
" let g:syntastic_clang_check_config_file = (string; default: '.syntastic_clang_check_config')
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" load .ycm_extra_conf.py notification on | off
let g:ycm_confirm_extra_conf=0

" default tag s-tab Conflict with autocomplete
"let g:ycm_key_list_select_completion=['<c-n>']
"let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
"let g:ycm_key_list_previous_completion = ['<Up>']

" use ctags flags
let g:ycm_collect_identifiers_from_tags_files=1
" list match items begin with the 2th char inputed
let g:ycm_min_num_of_chars_for_completion=2
" disable cache matching, regenerate match items every time
let g:ycm_cache_omnifunc=0
" key words complete
let g:ycm_seed_identifiers_with_syntax=1
" enable complete in comments
let g:ycm_complete_in_comments = 1
" enable complete in strings
let g:ycm_complete_in_strings = 1
" collect identifiers in comments and strings
let g:ycm_collect_identifiers_from_comments_and_strings = 0

let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
" jump to defination
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>jd :YcmCompleter GoToImplementationElseDeclaration<CR>
nmap <F4> :YcmDiags<CR>
" force recompile with syntastic
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
"nnoremap <leader>lo :lopen<CR> "open locationlist
"nnoremap <leader>lc :lclose<CR>    "close locationlis
"inoremap <leader><leader> <C-x><C-o>

" Syntastic settings
let g:syntastic_check_on_open = 1
let g:syntastic_c_checkers = ['clang_check', 'gcc']
" let g:syntastic_cpp_checkers = ['clang_check', 'g++']
let g:syntastic_cpp_checkers = ['g++']
