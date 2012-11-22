call pathogen#infect()
:set number
:syntax on
:set mouse=a
:colorscheme desert
:set hlsearch
:set autoindent
:set foldmethod=syntax  "fold based on indent
:set foldnestmax=10      "deepest fold is 10 levels
:set nofoldenable        "dont fold by default
:set foldlevel=1         "this is just what i use
:set autoindent  " noautoindent
:set tabstop=4
:set shiftwidth=4
:set textwidth=120

:set expandtab

" --- OmniCppComplete ---
" -- required --
set nocp " non vi compatible mode
filetype plugin on " enable plugins
" -- optional --
" auto close options when exiting insert mode autocmd InsertLeave * if pumvisible() == 0|pclose|endif set completeopt=menu,menuone " -- configs -- let OmniCpp_MayCompleteDot = 1 " autocomplete with .
let OmniCpp_MayCompleteArrow = 1 " autocomplete with -> let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert) let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype (i.e. parameters) in popup window let OmniCpp_ShowScopeInAbbr = 0

" -- ctags --
" map <ctrl>+F12 to generate ctags for current folder:
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --extra=+f --exclude=prebuilt* --exclude=docs --exclude=out .<CR><CR> " add current directory's generated tags file to available tags set tags+=./tags
map <C-F11> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --extra=+f --exclude=prebuilt* --exclude=docs --exclude=out -f ~/.vim/tags/android ~/devel/edream6.1.1-riogrande-release<CR><CR> " add current directory's generated tags file to available tags set tags+=./tags
" TlistToggle and NERDTreeToggle shortcut
map <C-F6> :NERDTreeToggle <CR><CR>
map <C-F5> :TlistToggle <CR><CR>
map <C-F10> :BufExplorer <CR>
map <C-F9> :CCTreeLoadDB <CR><CR>

     let g:CCTreeKeyTraceForwardTree = '<C-p>' 
     let g:CCTreeKeyTraceReverseTree = '<C-o>' 
     let g:CCTreeKeyHilightTree = '<C-l>'        " Static highlighting
     let g:CCTreeKeyToggleWindow = '<C-F7>' 
     let g:CCTreeKeyCompressTree = 'zs'     " Compress call-tree 
     let g:CCTreeKeyDepthPlus = '<C-\>=' 
     let g:CCTreeKeyDepthMinus = '<C-\>-'
     let g:CCTreeWindowWidth = 40

:let Grep_Default_Filelist = '*.c *.cpp *.asm *.java *.aidl' 
:set listchars=tab:>-,trail:-
:set list
:let g:ogs_app_url = 'http://opengrok.sonyericsson.net'
:let g:ogs_project = '/jellybean/'
:let g:ogs_browser_command = 'xdg-open'

:set tags+=./tags
:set tags+=~/.vim/tags/android

noremap <c-s-up> :call feedkeys( line('.')==1 ? '' : 'ddkP' )<CR>
noremap <c-s-down> ddp

noremap <C-right> <Esc><C-W>l
noremap <C-left> <Esc><C-W>h

if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=45 columns=120
endif

