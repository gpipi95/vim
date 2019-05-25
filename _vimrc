syntax on
filetype plugin on
"source $VIMRUNTIME/vimrc_example.vim
"
"set diffexpr=MyDiff()
"function MyDiff()
"  let opt = '-a --binary '
"  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
"  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
"  let arg1 = v:fname_in
"  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
"  let arg2 = v:fname_new
"  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
"  let arg3 = v:fname_out
"  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
"  if $VIMRUNTIME =~ ' '
"    if &sh =~ '\<cmd'
"      if empty(&shellxquote)
"        let l:shxq_sav = ''
"        set shellxquote&
"      endif
"      let cmd = '"' . $VIMRUNTIME . '\diff"'
"    else
"      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
"    endif
"  else
"    let cmd = $VIMRUNTIME . '\diff'
"  endif
"  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
"  if exists('l:shxq_sav')
"    let &shellxquote=l:shxq_sav
"  endif
"endfunction

""""""""""""""""""""""""""""""
"vundle
""""""""""""""""""""""""""""""
set rtp+=$VIMRUNTIME/../bundle/Vundle.vim/
call vundle#begin('$VIMRUNTIME/../bundle/')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

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
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
""""""""""""""""""""""""""""""
"start from here
""""""""""""""""""""""""""""""
"let g:ycm_global_ycm_extra_conf = 'D:\green\Vim\vimfiles\bundle\.ycm_extra_conf.py' 
"Trigger configuration. Do not use <tab> if you use
"https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:airline#extensions#tabline#enable = 1
set incsearch   "increment search
set hls         "hightline search
set nowrap
set nocompatible
set nobackup
set number
set rnu
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
