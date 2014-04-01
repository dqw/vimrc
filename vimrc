"定义项目路径
let $project=$HOME."/project"
let $CurrentProject=$project
let $BackDir=$HOME."/temp/vim"
command! -nargs=1 -bar Pro :let $CurrentProject = expand('$<args>')|:cd $CurrentProject
" 关闭 vi 兼容模式
set nocompatible
filetype off                   " required!

" 终端鼠标支持
set mouse=a


set rtp+=$HOME/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

"配色
set t_Co=256
"color darkblue
Bundle 'vim-scripts/Lucius'
Bundle 'vim-scripts/Zenburn'
Bundle 'tomasr/molokai'
Bundle 'altercation/vim-colors-solarized'
color myluciusnew
set guifont=Monospace\ 11
set background=dark

"设置leader为,
let mapleader=","
let g:mapleader=","

"自动语法高亮
syntax on
"检测文件类型
filetype on
"检测文件类型插件
filetype plugin on
filetype indent on
"快速设置文件类型为PHP
command Setphp :set filetype=php

"缩进
set tabstop=4
"set softtabstop=4
set shiftwidth=4
set expandtab
"自动缩进
set autoindent
set smartindent
"set cindent

"行号
set number

"搜索到文件两端时不重新搜索
set nowrapscan

"搜索高亮
set hlsearch

"Fast saving
nmap <silent> <leader>ww :w<cr>
nmap <silent> <leader>wf :w!<cr>

"quickfix
"map <F11> :copen<CR>
"map <F12> :cclose<CR>
map <leader>fo :copen<CR>
map <leader>fc :cclose<CR>
map <leader>fn :cn<cr>
map <leader>fp :cp<cr>
"Grep
map <leader>fg :Grep<cr>
"Ack
map <leader>fa :Ack<cr>

"插入模式下退格键
set backspace=2
set backspace=indent,eol,start
set whichwrap+=b,<,>,h,l

"映射系统剪切板
nnoremap <silent> <leader>sy "+y
nnoremap <silent> <leader>sp "+p
" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x
" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y
" CTRL-V and SHIFT-Insert are Paste
map <C-V>        "+gP
map <S-Insert>        "+gP
cmap <C-V>        <C-R>+
cmap <S-Insert>        <C-R>+

"编码
let &termencoding=&encoding
set fileencodings=utf-8,gbk,ucs-bom,cp936

"备份
"set nobackup                " 覆盖文件时不备份
"把备份设到别的目录
set backupdir=$BackDir
"缓存文件目录
set directory=$BackDir
"if exists('&autoread')
"  set autoread "文件在外部更新后，自动加载
"endif

" 自动切换当前目录为当前文件所在的目录
"set autochdir
"Switch to current dir
"自动切换到当前项目目录
map <leader>cd :cd %:p:h<cr>
map <leader>cp :cd $CurrentProject<cr>

"状态栏现实文件名、编码等信息
set statusline=[%F]%y%r%m%*%=[%{getcwd()}][Line:%l/%L,Column:%c][%p%%]
set statusline+=\ 
set statusline+=%<\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"} 
set laststatus=2

"设置退出模式的延迟时间
set timeoutlen=1000 ttimeoutlen=0
"Change cursor shape in different modes
"if has("autocmd")
   "au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
   "au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
   "au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
"endif
"状态栏插入模式变色
au InsertEnter * hi StatusLine term=reverse ctermbg=4 gui=undercurl guisp=Magenta
au InsertLeave * hi StatusLine term=reverse ctermbg=gray gui=undercurl guisp=Magenta

"Toggle Menu and Toolbar
set guioptions-=m
set guioptions-=T
map <silent> <F8> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>

" 窗口切换
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k

"<ctrl-x>_<ctrl-k> 打开提示
inoremap <C-K> <C-X><C-K>
autocmd filetype javascript set dictionary+=$HOME/.vim/dict/javascript.dic
autocmd filetype javascript set dictionary+=$HOME/.vim/dict/node.dic
autocmd filetype css set dictionary+=$HOME/.vim/dict/css.dic
autocmd filetype php set dictionary+=$HOME/.vim/dict/php.dic

"phpdoc k开启
set runtimepath+=$HOME/.vim/phpdoc
autocmd BufNewFile,Bufread *.module,*.inc,*.php set keywordprg="help"

"My Bundles here:
"Bundle 'vim-scripts/ZenCoding.vim'
Bundle 'mattn/emmet-vim'
Bundle 'vim-scripts/The-NERD-Commenter'
Bundle 'vim-scripts/sql.vim--Stinson'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'vim-scripts/tlib'
Bundle "dqw/snipmate-snippets"
Bundle 'garbas/vim-snipmate'
Bundle 'vim-scripts/surround.vim'
Bundle 'tpope/vim-repeat'
Bundle 'vim-scripts/grep.vim'
Bundle 'mileszs/ack.vim'
Bundle 'tmhedberg/matchit'

"vim-indent-guides
"缩进线
"<leader>ig
set ts=4 sw=4 et
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
Bundle 'nathanaelkane/vim-indent-guides'

"ctags
"ctrl+] 跳转到函数定义
"ctrl+t 跳回
"设置当前目录后不用再指定tags文件位置，修改tags生成文件的路径即可
Bundle 'vim-scripts/ctags.vim'

"easymotion
"<leader><leader>f
"<leader><leader>F
"<leader><leader>w
"<leader><leader>jklh
Bundle 'Lokaltog/vim-easymotion'

"css预览插件
Bundle 'ap/vim-css-color'

"行标记 mm
Bundle 'dqw/Visual-Mark'

"关键字标记 <leader>m <leader>n
Bundle 'vim-scripts/Mark--Karkat'

"Tagbar
Bundle 'majutsushi/tagbar'
let g:tagbar_phpctags_bin=$HOME."/.vim/bin/phpctags"
Bundle 'techlivezheng/vim-plugin-tagbar-phpctags'
nmap <F9> :TagbarToggle<CR> 
"隐藏函数
let g:tagbar_type_php = {
\ 'ctagstype' : 'php',
\ 'kinds' : [
\ 'i:interfaces',
\ 'c:classes',
\ 'd:constant definitions',
\ 'f:functions',
\ 'j:javascript functions:1'
\ ]
\ }

"命令行补全
Bundle 'vim-scripts/CmdlineComplete'

"markdown模板
"Bundle 'tpope/vim-markdown'
":Me preview markdown
":Mer refresh
"python报错
"Bundle 'waylan/vim-markdown-extra-preview'
"let b:VMEPstylesheet = 'bitbucket.css'
"markdown预览
"Bundle 'suan/vim-instant-markdown'

"NERDTree插件
Bundle 'vim-scripts/The-NERD-tree'
"autocmd VimEnter * NERDTree
"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin
"==== F4 NERDTree 切换
map <F4> :NERDTreeToggle<CR>
imap <F4> <ESC>:NERDTreeToggle<CR>
map <F3> :NERDTreeFind<cr>

" {{{ mru.vim 记录最近打开的文件
Bundle 'mru.vim'
"let MRU_File = $VIMFILES."/_vim_mru_files"
let MRU_File = $BackDir."/_vim_mru_files"
let MRU_Max_Entries = 500
let MRU_Add_Menu = 0
nmap <leader>fr :MRU<cr>
" }}}

"ctrlp
Bundle 'kien/ctrlp.vim'
":help ctrlp-options
set wildignore+=*/tmp/*,*/cache/*,*.so,*.swp,*.zip,*.jpg,*.jpeg,*.gif,*.bmp,*.png " MacOSX/Linux
"set wildignore+=tmp\*,*.swp,*.zip,*.exe " Windows
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_working_path_mode=1
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_max_height = 20
"let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_cache_dir=$BackDir."/_ctrlp"
let g:ctrlp_extensions=['tag', 'buffertag', 'quickfix', 'dir', 'rtscript']
nmap <leader>fd :CtrlP $CurrentProject<cr>
nmap <leader>ff :CtrlPCurFile<cr>
nmap <leader>fb :CtrlPBuffer<cr>
nmap <leader>ft :CtrlPBufTag<cr>
nmap <leader>fm :CtrlPMixed<cr>
"<c-d> 切换完全/只文件名搜索
"<c-r> 切换搜索匹配模式：字符串/正则

"PHP 辅助
"Bundle 'spf13/PIV'

"语法检查
Bundle 'scrooloose/syntastic'
"let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']
let g:syntastic_php_checkers=['php', 'phpmd']
let g:syntastic_python_checkers=['flake8']
let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_javascript_jshint_conf="~/.jshintrc"
"js优化
"Bundle 'maksimr/vim-jsbeautify'
"js缩进
Bundle 'pangloss/vim-javascript'
"Bundle 'nrocco/vim-phplint'

"php变量定义检查
"经常报错无法正常使用
"vim 2803
"Bundle 'vim-scripts/php_localvarcheck.vim'

"循环剪切板
"Bundel 'vim-scripts/YankRing.vim'

"编辑vimrc
nmap <leader>rc :tabnew $HOME/.vimrc<cr>
" 重新载入配置
map <leader>rl :source $HOME/.vimrc<CR>
