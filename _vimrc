syntax on
filetype plugin on
filetype indent on
""""""""""""""""""""""""""""""
"vundle
""""""""""""""""""""""""""""""
set rtp+=$VIMRUNTIME/../bundle/Vundle.vim/
call vundle#begin('$VIMRUNTIME/../bundle/')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes' 
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'SirVer/ultisnips'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'kien/ctrlp.vim'
Plugin 'honza/vim-snippets'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
Plugin 'rhysd/vim-clang-format'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'WolfgangMehner/c-support'
Plugin 'vim-scripts/a.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
""""""""""""""""""""""""""""""
"start from here
""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
"youcompleteme configuration""
""""""""""""""""""""""""""""""
"let g:ycm_global_ycm_extra_conf = 'D:\green\Vim\vimfiles\bundle\.ycm_extra_conf.py' 
let g:ycm_confirm_extra_conf = 0
"Trigger configuration. Do not use <tab> if you use
"https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:airline#extensions#tabline#enable = 1
set backspace=indent,eol,start
set incsearch   "increment search
set hls         "hightline search
set nowrap
set nocompatible
set nobackup
set number
set rnu
set autoindent
set smartindent
set expandtab
set shiftwidth=4
""""""""""""""""""""""""""""""
"set wildmode """"""""""""""""
""""""""""""""""""""""""""""""
set wildmenu
set wildmode=full
""""""""""""""""""""""""""""""
"set chinese menu"""""""""""""
""""""""""""""""""""""""""""""
set encoding=utf-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
language message zh_CN.utf-8
""""""""""""""""""""""""""""""
"color
""""""""""""""""""""""""""""""
if has("gui_running")
	colorscheme desert
else
	colorscheme marklar
endif
""""""""""""""""""""""""""""""
"clang-format configure
""""""""""""""""""""""""""""""
let g:clang_format#command = 'C:\Program Files\LLVM\bin\clang-format.exe'
nmap <C-k> :ClangFormat<cr>
autocmd FileType c ClangFormatAutoEnable
let g:clang_format#detect_style_file = 0
let g:clang_format#style_options = {
        \ "Language" : "Cpp",
        \ "BasedOnStyle" : "WebKit",
        \ "AlignTrailingComments": "true"}
