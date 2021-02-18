"解决中文乱码
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set enc=utf8
set fencs=utf8,gbk,gb2312,gb18030
"显示绝对行号
set number
"相对行号
set norelativenumber
"语法高亮
syntax on
"按R执行刷新vim配置文件的命令，<CR是回车>
map R :source $MYVIMRC<CR>
"在光标所在行显示一条线
set cursorline
"让一行的字符不超过屏幕显示的范围，会换行显示
set wrap
"显示当前执行的指令
set showcmd
"在命令模式下按TAB自动补全
set wildmenu
"高亮搜索结果
set hlsearch
"添加""nohlsearch"指令，在命令模式下可以使用
exec "nohlsearch"
"让vim中的mapleader为空格键
let mapleader=" "
"在输入空格加回车时执行取消高亮的命令
noremap <LEADER><CR> :nohlsearch<CR>
"边输入边高亮
set incsearch
"搜索时忽略大小写
set ignorecase
"搜索时智能忽略大小写，比如搜索大写字母时不会匹配到小写字母
set smartcase
"在搜索上/下一个匹配结果时把匹配结果所在行定位到屏幕中央
noremap n nzz
noremap N Nzz

"插件安装
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'

call plug#end()
