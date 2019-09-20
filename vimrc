call pathogen#infect()
let g:Powerline_symbols = 'fancy'
set nocompatible

filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Lokaltog/powerline'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-pathogen'
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'klen/python-mode'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'rosenfeld/conque-term'
Plugin 'vim-scripts/DfrankUtil'
Plugin 'vim-scripts/vimprj'
Plugin 'vim-scripts/genutils'
Plugin 'SirVer/UltiSnips'
Plugin 'honza/vim-snippets'
Plugin 'dimasg/vim-mark'
Plugin 'jdonaldson/vaxe'
Plugin 'majutsushi/tagbar'
Plugin 'hari-rangarajan/CCTree'
Plugin 'peterhoeg/vim-qml'
Plugin 'tpope/vim-surround'
Plugin 'fatih/vim-go'
Plugin 'rust-lang/rust.vim'
Plugin 'KSP-KOS/EditorTools', {'rtp': 'VIM/vim-kerboscript'}
call vundle#end()

" -- required --
set nocp " non vi compatible mode
filetype plugin indent on " enable plugins
set number
syntax on

let g:ycm_server_python_interpreter = '/usr/bin/python'
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

set mouse=a
colorscheme lucius
set incsearch
set hlsearch
set autoindent
set foldmethod=syntax  "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use
set autoindent smartindent
set backspace=eol,start,indent
set ignorecase smartcase
set hidden
set colorcolumn=80

:inoremap \fn <C-R>=expand("%:t")<CR>
cabbr <expr> %% expand('%:p:h')
"nnoremap <C-a> :A<CR>
nnoremap <C-b> :Kwbd<CR>
" map C-H to toggle nohlsearch
nnoremap <C-h> :set nohlsearch! nohlsearch?<CR>
nmap <C-s> :!find -name '*.cpp' -o -name '*.h' > cscope.files<CR> :!cscope -b<CR>


let kernel_dev=0

if kernel_dev
    set noexpandtab                         " use tabs, not spaces
    set tabstop=8                           " tabstops of 8
    set shiftwidth=8                        " indents of 8
    set textwidth=78                        " screen in 80 columns wide, wrap at 78
else
    set tabstop=4
    set shiftwidth=4
    set textwidth=120
    set expandtab
endif

" --- OmniCppComplete ---
" -- optional --
" auto close options when exiting insert mode autocmd InsertLeave * if pumvisible() == 0|pclose|endif set completeopt=menu,menuone " -- configs -- let OmniCpp_MayCompleteDot = 1 " autocomplete with .
"let OmniCpp_MayCompleteArrow = 1 " autocomplete with -> let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
"let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert) let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype (i.e. parameters) in popup window let OmniCpp_ShowScopeInAbbr = 0

" -- ctags --
"map <C-F11> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --extra=+f --exclude=prebuilt* --exclude=docs --exclude=out -f ~/.vim/tags/<tag-file> ~/<source-dir>/<CR><CR>
map <C-F11> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --extra=+f --exclude=prebuilt* --exclude=docs --exclude=out -f ~/.vim/tags/android ~/android/system/<CR><CR>
" map <ctrl>+F12 to generate ctags for current folder:
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --extra=+f --exclude=prebuilt* --exclude=docs --exclude=out --exclude=.pc --exclude=*.js .<CR><CR> " add current directory's generated tags file to available tags set tags+=./tags
" Tagbar and NERDTreeToggle shortcut
map <C-F6> :NERDTreeToggle <CR><CR>
map <C-F5> :Tagbar<CR><CR>
map <C-F10> :BufExplorer <CR>
map <C-F9> :CCTreeLoadDB <CR><CR>

"let g:CCTreeKeyTraceForwardTree = '<C-p>' 
""let g:CCTreeKeyTraceReverseTree = '<C-o>' 
"let g:CCTreeKeyHilightTree = '<C-l>'        " Static highlighting
"let g:CCTreeKeyToggleWindow = '<C-F7>' 
"let g:CCTreeKeyCompressTree = 'zs'     " Compress call-tree 
"let g:CCTreeKeyDepthPlus = '<C-\>=' 
"let g:CCTreeKeyDepthMinus = '<C-\>-'
let g:CCTreeWindowWidth = 40

":let Grep_Default_Filelist = '*.c *.cpp *.asm *.java *.aidl' 
:let Grep_Default_Filelist = '*.c *.cpp *.h *.hpp'
:set listchars=tab:>-,trail:-
:set list

:set tags+=./tags

noremap <c-s-up> :call feedkeys( line('.')==1 ? '' : 'ddkP' )<CR>
noremap <c-s-down> ddp

noremap <C-right> <Esc><C-W>l
noremap <C-left> <Esc><C-W>h
noremap <C-up> <Esc><C-W>k
noremap <C-down> <Esc><C-W>j

if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=50 columns=160
  map  <silent>  <S-Insert>  "+p
  imap <silent>  <S-Insert>  <Esc>"+pa
  set guioptions-=m " remove menu
  set guioptions-=T " remove toolbar
endif

set guifont=Ubuntu\ Mono\ for\ Powerline\ 11

syn match ErrorLeadSpace /^ \+/             " highlight leading spaces
syn match ErrorTailSpace /^ \+$/            " highlight trailing spaces
syn match Error80            /\%>80v.\+/    " highlight in red anything after 80 in line

set formatoptions=tcqlron
set cinoptions=:0,l1,t0,g0
set foldmethod=syntax

if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb
endif
map <C-\><Space> :cs find s <C-R>=expand("<cword>")<CR><CR>

" expand current workdir with %%
cabbr <expr> %% expand('%:p:h')

let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>jf :YcmCompleter GoToDeclaration<CR>

function! StripTrailingWhitespace()
    normal mZ
    let l:chars = col("$")
    %s/\s\+$//e
    if (line("'Z") != line(".")) || (l:chars != col("$"))
        echo "Trailing whitespace stripped\n"
    endif
    normal `Z
endfunction

let g:pymode_rope_completion = 0

set path+=**
set wildmenu

set backupdir=~/.vim/backups//
set directory=~/.vim/backups//
