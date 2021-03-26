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
"永远显示底部状态栏(安装vim-airline插件才有状态栏）
set laststatus=2
 " 支持 powerline 字体
let g:airline_powerline_fonts = 1 
" 显示窗口tab和buffer
"let g:airline#extensions#tabline#enabled = 1 
"设置当前目录为工作目录
set autochdir
"每次打开vim自动回到上一次编辑的位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"让状态栏有更多的图标
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '❯'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '❮'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
"让光标在不同模式下有同样式
let &t_SI.="\e[5 q" "插入模式
let &t_SR.="\e[4 q" "替换模式
let &t_EI.="\e[1 q" "普通模式

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
"在普通模式下按z可以退出vim
map Z :q<CR>
"标签管理（在不退出vim并相对全屏的打开一个新文件）
map <C-n> :tabe<CR>>
map nl :+tabnext<CR>
map nh :-tabnext<CR>
map nc :tabclose<CR>
"按tr打开Nerdtree
map tf :NERDTreeFind<CR>
map tr :NERDTree<CR>
map tt :NERDTreeToggle<CR>
"按lf搜索当前目录下的文件
map lf :LeaderfFile<CR>
"按ll搜索当前文件中有的某个单词
map ll :LeaderfLine<CR>
"按lc搜索当前文件里的函数
map lc :LeaderfFunction<CR>
"在不同模式下使用不同的光标样式
"let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"let &t_SR = "\<Esc>]50;CursorShape=2\x7"
"let &t_EI = "\<Esc>]50;CursorShape=0\x7"


"插件安装
call plug#begin('~/.vim/plugged')

"设置状态栏
Plug 'vim-airline/vim-airline'
"状态栏配色
Plug 'vim-airline/vim-airline-themes'
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
"使用LeaderF
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
"显示缩进对齐
Plug'nathanaelkane/vim-indent-guides'
"代码片段补全
Plug 'SirVer/ultisnips'
"默认代码仓库
"Plug 'keelii/vim-snippets'
"我的代码仓库
Plug 'Sanchez-c137/pianduan'
"符号自动补全
Plug 'jiangmiao/auto-pairs'

call plug#end()


"配置auto-pairs插件
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '<':'>'}
"配置UltiSnips插件
let g:UltiSnipsExpandTrigger="<tab>"
" 使用 tab 切换下一个触发点，shit+tab 上一个触发点
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
" 使用 UltiSnipsEdit 命令时垂直分割屏幕
let g:UltiSnipsEditSplit="vertical"
"指定代码仓库路径
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/plugged/pianduan/Ultisnips']
"按gu可以显示出对齐线
map gu :IndentGuidesEnable<CR>
"按ug可以取消显示对齐线
map gu :IndentGuidesDisable<CR>
"让显示缩进对齐的线的宽度为1
let g:indent_guides_guide_size=1
"显示对齐线的缩进级别
let g:indent_guides_start_level = 1 
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
	"C语言补全支持	
"	\'coc-ccls']


"B
"让光标所在行的线占满一行，比较美观
color snazzy
"在一些透明终端下vim也可以让背景透明
let g:SnazzyTransparent = 1
