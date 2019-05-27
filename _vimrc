syntax on
source $VIMRUNTIME/vimrc_example.vim
set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction
filetype plugin on
filetype indent on
""""""""""""""""""""""""""""""
"vundle
""""""""""""""""""""""""""""""
set rtp+=$VIMRUNTIME/../bundle/Vundle.vim/
call vundle#begin('$VIMRUNTIME/../bundle/')
" let Vundle manage Vundle, required
"Plugin 'Valloric/YouCompleteMe'
Plugin 'Align'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe', {'pinned':1}
Plugin 'VundleVim/Vundle.vim'
Plugin 'WolfgangMehner/c-support'
Plugin 'ervandew/supertab'
Plugin 'honza/vim-snippets'
Plugin 'kien/ctrlp.vim'
Plugin 'rdnetto/YCM-Generator'
Plugin 'rhysd/vim-clang-format'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'scrooloose/nerdtree'
Plugin 'taglist.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes' 
Plugin 'vim-scripts/a.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
""""""""""""""""""""""""""""""
"youcompleteme configuration""
""""""""""""""""""""""""""""""
"let g:ycm_global_ycm_extra_conf = 'D:\green\Vim\vimfiles\bundle\.ycm_extra_conf.py' 
let g:ycm_confirm_extra_conf = 0
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']
"let g:ycm_global_ycm_extra_conf = $VIMPATH.'\.ycm_extra_conf.py'
" 开启基于tag的补全，可以在这之后添加需要的标签路径  
let g:ycm_collect_identifiers_from_tags_files=1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
" 输入第2个字符开始补全
let g:ycm_min_num_of_chars_for_completion=2
" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 开启语义补全
let g:ycm_seed_identifiers_with_syntax=1	
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
" 设置在下面几种格式的文件上屏蔽ycm
"let g:ycm_filetype_blacklist = {
"      \ 'tagbar' : 1,
"      \ 'nerdtree' : 1,
"      \}
" 修改对C函数的补全快捷键，默认是CTRL + space，修改为ALT + i
let g:ycm_key_invoke_completion = '<C-b>'
set completeopt -= "preview"

let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:airline#extensions#tabline#enable = 1

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

""""""""""""""""""""""""""""""
"airline setting
""""""""""""""""""""""""""""""
function! AirlineInit()
    let g:airline_section_x = airline#section#create(['filetype', '[%n]'])
    let g:airline_section_warning = airline#section#create([''])
    let g:airline_section_error = airline#section#create([''])
    let g:airline_theme='light'
  endfunction
  autocmd User AirlineAfterInit call AirlineInit()

""""""""""""""""""""""""""""
"解决Align的中文问题
""""""""""""""""""""""""""""
let g:Align_xstrlen= 3
let g:clang_complete_copen=1
let g:clang_periodic_quickfix=1
let g:clang_snippets=1
let g:clang_close_preview=1
let g:clang_use_library=1
let g:clang_user_options='-stdlib=libc++ -std=c++11 -IIncludePath'
:packadd! editexisting
""""""""""""""""""""""""""""
"ctags
""""""""""""""""""""""""""""
set tags=tags
set tags+=./tags
set hidden
set backspace=indent,eol,start
set incsearch   "increment search
set hls         "hightline search
set nowrap
set nocompatible
set nobackup
set number
set nobackup
set lbr      " 开启整词断行
set autoread
set rnu
set autoindent
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4
set foldmethod=syntax
set guioptions+=mT
set laststatus=2            "只有一个窗口时也保留状态栏
""""""""""""""""""""""""""""""
"set wildmode """"""""""""""""
""""""""""""""""""""""""""""""
set wildmenu
set wildmode=full
""""""""""""""""""""""""""""""
"set chinese menu"""""""""""""
""""""""""""""""""""""""""""""
set termencoding=chinese                  "Console 下的中文显示问题
set fileencodings=utf-8,chinese,latin-1
if has("win32")
    set fileencoding=chinese
else
    set fileencoding=utf-8
endif
"解决console输出乱码
language messages zh_CN.utf-8
set encoding=utf-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
""""""""""""""""""""""""""""""
"color
""""""""""""""""""""""""""""""
if has("gui_running")
	colorscheme desert
else
	colorscheme marklar
endif
