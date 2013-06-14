call pathogen#infect()
let g:Powerline_symbols = 'fancy'
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-pathogen'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'klen/python-mode'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
Bundle 'rosenfeld/conque-term'
Bundle 'vim-scripts/DfrankUtil'
Bundle 'vim-scripts/vimprj'
Bundle 'vim-scripts/genutils'
Bundle 'pydave/vim-perforce'
Bundle 'vim-scripts/UltiSnips'

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0

set number
syntax on
set mouse=a
colorscheme desert
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
set colorcolumn=100

:inoremap \fn <C-R>=expand("%:t")<CR>
cabbr <expr> %% expand('%:p:h')
nnoremap <C-a> :A<CR>
nnoremap <C-w> :Kwbd<CR>
nnoremap <C-S-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <C-b> :!clang++ %<CR>

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
" -- required --
set nocp " non vi compatible mode
filetype plugin on " enable plugins
" -- optional --
" auto close options when exiting insert mode autocmd InsertLeave * if pumvisible() == 0|pclose|endif set completeopt=menu,menuone " -- configs -- let OmniCpp_MayCompleteDot = 1 " autocomplete with .
"let OmniCpp_MayCompleteArrow = 1 " autocomplete with -> let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
"let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert) let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype (i.e. parameters) in popup window let OmniCpp_ShowScopeInAbbr = 0

" -- ctags --
"map <C-F11> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --extra=+f --exclude=prebuilt* --exclude=docs --exclude=out -f ~/.vim/tags/<tag-file> ~/<source-dir>/<CR><CR>
map <C-F11> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --extra=+f --exclude=prebuilt* --exclude=docs --exclude=out -f ~/.vim/tags/android ~/android/system/<CR><CR>
" map <ctrl>+F12 to generate ctags for current folder:
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --extra=+f --exclude=prebuilt* --exclude=docs --exclude=out .<CR><CR> " add current directory's generated tags file to available tags set tags+=./tags
" TlistToggle and NERDTreeToggle shortcut
map <C-F6> :NERDTreeToggle <CR><CR>
map <C-F5> :TlistToggle <CR><CR>
map <C-F10> :BufExplorer <CR>
map <C-F9> :CCTreeLoadDB <CR><CR>

     let g:CCTreeKeyTraceForwardTree = '<C-p>' 
     "let g:CCTreeKeyTraceReverseTree = '<C-o>' 
     let g:CCTreeKeyHilightTree = '<C-l>'        " Static highlighting
     let g:CCTreeKeyToggleWindow = '<C-F7>' 
     let g:CCTreeKeyCompressTree = 'zs'     " Compress call-tree 
     let g:CCTreeKeyDepthPlus = '<C-\>=' 
     let g:CCTreeKeyDepthMinus = '<C-\>-'
     let g:CCTreeWindowWidth = 40

":let Grep_Default_Filelist = '*.c *.cpp *.asm *.java *.aidl' 
:let Grep_Default_Filelist = '*.c *.cpp *.h'
:set listchars=tab:>-,trail:-
:set list

:set tags+=./tags
:set tags+=~/.vim/tags/android

noremap <c-s-up> :call feedkeys( line('.')==1 ? '' : 'ddkP' )<CR>
noremap <c-s-down> ddp

noremap <C-right> <Esc><C-W>l
noremap <C-left> <Esc><C-W>h

if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=50 columns=160
endif

set guifont=Ubuntu\ Mono\ for\ Powerline\ 12

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
map <C-\> :cs find s <C-R>=expand("<cword>")<CR><CR>

so ~/.vim/autoload/headerguard.vim
:imap <C-Space> <Plug>snipMateNextOrTrigger
:smap <C-Space> <Plug>snipMateNextOrTrigger

"" YouCompleteMe
let g:ycm_key_list_previous_completion=['<Up>']

"" Ultisnips
let g:UltiSnipsExpandTrigger="<c-tab>"
let g:UltiSnipsListSnippets="<c-s-tab>"
