"兼容vi
set nocompatible
"识别文件格式
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
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

"分屏（注意输入s时要马上指定方向，不然会触发vim中其他命令）
"向上
map sk :set nosplitbelow<CR>:split<CR>
"向下
map sj :set splitbelow<CR>:split<CR>
"向左
map sh :set nosplitright<CR>:vsplit<CR>
"向右
map sl :set splitright<CR>:vsplit<CR>
"在不同分屏之间移动，因为我用的是普通的键盘布局，所以就直接用空格键代替Ctrl+w了
map <LEADER> <C-w>
"调整分屏大小（要注意，只有当光标所在屏在左边或下边时操作逻辑才是顺方向的在另两屏是反的）
map zk :res +5<CR>
map zj :res -5<CR>
map zh :vertical resize-5<CR>
map zl :vertical resize+5<CR>
"在垂直分屏和水平分屏之间切换
"垂直
map sz <C-w>t<C-w>H 
"水平
map sp <C-w>t<C-w>K 

"标签管理（在不退出vim并相对全屏的打开一个新文件）
map <C-n> :tabe<CR>>
map nl :+tabnext<CR>
map nh :-tabnext<CR>
map nc :tabclose<CR>

""插件安装
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'

call plug#end()
