"兼容vi下的操作和一些插件
set nocompatible
"识别文件格式
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
"解决一些终端下vim配色不正常
let &t_ut=''
"可以在vim中使用鼠标
set mouse=a
"设置底部状态栏的大小(安装vim-airline插件才有状态栏）
set laststatus=2
"设置当前目录为工作目录
set autochdir
"每次打开vim自动回到上一次编辑的位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"让光标在不同模式下有同样式

"解决中文乱码
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set encoding=utf-8
set fencs=utf8,gbk,gb2312,gb18030
"显示绝对行号
set number
"相对行号
set relativenumber
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
map gk :set nosplitbelow<CR>:split<CR>
"向下
map gj :set splitbelow<CR>:split<CR>
"向左
map gh :set nosplitright<CR>:vsplit<CR>
"向右
map gl :set splitright<CR>:vsplit<CR>
"在不同分屏之间移动，因为我用的是普通的键盘布局，所以就直接用空格键代替Ctrl+w了
map <LEADER> <C-w>
"调整分屏大小（要注意，只有当光标所在屏在左边或下边时操作逻辑才是顺方向的在另两屏是反的）
map zk :res +5<CR>
map zj :res -5<CR>
map zh :vertical resize-5<CR>
map zl :vertical resize+5<CR>
"在垂直分屏和水平分屏之间切换
"垂直
map gz <C-w>t<C-w>H 
"水平
map gf <C-w>t<C-w>K 
"在普通模式下按p可以退出vim
map q :q<CR>
"标签管理（在不退出vim并相对全屏的打开一个新文件）
map <C-n> :tabe<CR>>
map nl :+tabnext<CR>
map nh :-tabnext<CR>
map nc :tabclose<CR>
"按tr打开Nerdtree
map tf :NERDTreeFind<CR>
map tr :NERDTree<CR>
map tt :NERDTreeToggle<CR>
"在不同模式下使用不同的光标样式
"let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"let &t_SR = "\<Esc>]50;CursorShape=2\x7"
"let &t_EI = "\<Esc>]50;CursorShape=0\x7"


"插件安装
call plug#begin('~/.vim/plugged')

"设置状态栏
Plug 'vim-airline/vim-airline'
"配色方案
Plug 'connorholyday/vim-snazzy'
"使用文件树
Plug 'preservim/nerdtree'
"安装coc
Plug 'neoclide/coc.nvim',{'branch':'release'}
"安装ycm
"Plug 'ycm-core/YouCompleteMe'
"让vim可以实时编辑并浏览Markdown文档（用浏览器浏览）
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'
"按回车选中一段代码块
Plug 'gcmt/wildfire.vim'
"选中代码块可以用S来让两段包裹一个特定标点符号，也可以用cs来更改标点符号
"Plug 'tpope/vim-surround'

call plug#end()



"在普通模式下按F8在浏览器实时浏览正在编辑的Markdown文档
nmap <silent> <F8> <Plug>MarkdownPreview        " for normal mode
"在编辑模式下按F8在浏览器实时浏览正在编辑的Markdown文档
imap <silent> <F8> <Plug>MarkdownPreview        " for normal mode
"在普通模式下按F9取消浏览
nmap <silent> <F9> <Plug>StopMarkdownPreview        " for normal mode
"在编辑模式下按F9取消浏览
imap <silent> <F9> <Plug>StopMarkdownPreview        " for normal mode


"在新机器上一启动vim就安装一些coc插件
"let g:coc_global_extensions = [
	"自动补全插件
"	\'coc-vimlsp'
	"coc插件搜索插件
"	\'coc-marketplace'


"让光标所在行的线占满一行，比较美观
color snazzy
"在一些透明终端下vim也可以让背景透明
let g:SnazzyTransparent = 1
color desert

