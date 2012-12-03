"=============================================================================
"      FileName: extended.vim
"   Description: 此文件映射了不少有用的快捷键，可大幅提高效率
"                使用前请确保已加载了基本配置文件 basic.vim
"        Author: 幽谷奇峰( https://twitter.com/yysfirecn )
"         Email: yysfire[at]gmail.com
"      HomePage: http://
"       Version: 6.0
"  Last Changed: 2012-12-03 00:35:46
"       History:
"=============================================================================
" 快捷键的前导键设为逗号，默认值是反斜杠 '\'
let mapleader = ","
let g:mapleader = ","

" 分号也可进入EX命令模式
nnoremap ; :

" 快速保存
nmap <silent> <leader>w :w<cr>
nmap <silent> <leader>wf :w!<cr>
" 快速退出
nmap <Leader>qw :w<CR><Esc>:call CustomExit()<CR>
nmap <Leader>qq :call CustomExit()<CR>
nmap <Leader>qf <Esc>:call CustomExit()!<CR>

" 快速切换文件编码格式
nmap <leader>fd :se ff=dos<cr>
nmap <leader>fu :se ff=unix<cr>
nmap <leader>fm :se ff=mac<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 最大化与全屏切换
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if g:ostype=='windows' && has('gui_running')
    let g:ScreenFlag = "Nomal"
    function! ToggleScreen()
        if g:ScreenFlag == "Max"
            let g:ScreenFlag = "Full"
            simalt ~x
            call libcallnr("vimtweak.dll", "EnableCaption", 0)
        elseif g:ScreenFlag == "Full"
            let g:ScreenFlag = "Nomal"
            call libcallnr("vimtweak.dll", "EnableCaption", 1)
            simalt ~r
        else
            let g:ScreenFlag = "Max"
            simalt ~x
        endif
    endfunction
    "F11 键使gvim 在全屏和普通模式间切换
    map <F11> :call ToggleScreen()<CR>
    imap <F11> <Esc>:call ToggleScreen()<CR>
    map <C-F11> :call libcallnr("vimtweak.dll", "SetAlpha", 200)<CR>
    map <S-F11> :call libcallnr("vimtweak.dll", "SetAlpha", 255)<CR>
endif

" Open MacVim in fullscreen mode
if has("gui_macvim")
    set fuoptions=maxvert,maxhorz
    au GUIEnter * set fullscreen
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 快速编辑和重载配置文件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if g:ostype=='unix'
    map <silent> <leader>ee :e ~/.vimrc<cr>
    map <silent> <leader>ss :source ~/.vimrc<cr>
    autocmd! bufwritepost .vimrc source ~/.vimrc
elseif g:ostype=='windows'
    map <silent> <leader>ee :e $VIM/_vimrc<cr>
    map <silent> <leader>ss :source $VIM/_vimrc<cr>
    autocmd! bufwritepost _vimrc source $VIM/_vimrc
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自动更新文件的最后修改时间
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufWritePre,FileWritePre *.{cpp,h,py,c,cc,hpp,vim,cxx,wiki},*vimrc call AutoUpdateTheLastUpdateInfo()
function! AutoUpdateTheLastUpdateInfo()
	let s:original_pos = getpos(".")
	let s:regexp = "^\\s*\\([#\\\"\\*]\\|\\/\\/\\)\\s\\+[lL]ast \\([uU]pdated\\|[cC]hanged\\|[mM]odified\\):"
	let s:lu = search(s:regexp)
	if s:lu != 0
		let s:update_str = matchstr(getline(s:lu), s:regexp)
		call setline(s:lu, s:update_str . strftime(" %Y-%m-%d %H:%M:%S"))
		call setpos(".", s:original_pos)
	endif
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 在缓冲区、标签、窗口中移动和切换
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 使j/k能在一个长行的自动断行间移动
map j gj
map k gk

" 去掉搜索产生的高亮
map <silent> <leader><cr> :noh<cr>

" 在分割窗口间切换
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" 卸载当前缓冲区
map <leader>bd :Bclose<cr>

" 卸载所有缓冲区,但不退出Vim（已知问题：导致NERDTree窗口无法打开）
"map <leader>ba :1,1000 bd!<cr>
map <leader>ba :1,1000 bd<cr>

" 新建标签
map <leader>tn :tabnew<cr>
" 关闭当前标签
map <leader>tc :tabclose<cr>
" 关闭其他所有标签
map <leader>to :tabonly<cr>
" 移动标签
map <leader>tm :tabmove 
" 以当前缓冲区的路径为工作路径打开新标签页，
" 当想在同一目录下编辑文件时很有用
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" 将当前窗口的工作路径设置为当前文件所在目录
map <leader>lc :lcd %:p:h<cr>:pwd<cr>
" 自动将当前窗口的工作路径设置为当前文件所在目录
"autocmd BufEnter * lcd %:p:h


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 一些有用的映射
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Normal和可视模式下用 ALT+[jk] 上下移动文本行
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" MAC 上用 Comamnd+[jk]
if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" 写入缓冲区时移除行尾的多余空格，diff文件除外
" From: Vigil
" @see http://blog.bs2.to/post/EdwardLee/17961
function! RemoveTrailingWhitespace()
    if &ft != "diff"
        let b:curcol = col(".")
        let b:curline = line(".")
        silent! %s/\s\+$//
        silent! %s/\(\s*\n\)\+\%$//
        call cursor(b:curline, b:curcol)
    endif
endfunction
autocmd BufWrite *.py :call RemoveTrailingWhitespace()
nmap <leader>rmw :call RemoveTrailingWhitespace()<cr>

" 移除文档中的 ^M 符号
noremap <Leader>rmm mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scripbble
"map <leader>q :e ~/buffer<cr>

" 快速切换粘贴模式的开与关
map <leader>pp :setlocal paste!<cr>


""""""""""""""""""""""""""""""
" => 可视模式下的搜索
""""""""""""""""""""""""""""""
" 选中一段文字,按 * 和 # 来全文搜索这段文字
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>
" 第二种实现方式
"vnoremap  *  y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
"vnoremap  #  y?<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>

" When you press gv you vimgrep after the selected text
" 按 gv 来 vimgrep 选中的文本
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Open vimgrep and put the cursor in the right position
map <leader>vg :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>rs you can search and replace the selected text
vnoremap <silent> <leader>rs :call VisualSelection('replace')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   :cw
"
" To go to the next search result do:
"   :cn
"
" To go to the previous search results do:
"   :cp
"
"map <leader>cp :botright cope<cr>

" 不用<leader>cn,避免和nerdcomment插件的相冲突 
map <leader>cx :cn<cr>
map <leader>cp :cp<cr>

" 将quickfix窗口的信息复制粘贴到新标签里
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 控制台的相关映射
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart mappings on the command line
cno $h e ~/
cno $d e ~/Desktop/
cno $j e ./
cno $c e <C-\>eCurrentFileDir("e")<cr>

" $q is super useful when browsing on the command line
" it deletes everything until the last slash 
cno $q <C-\>eDeleteTillSlash()<cr>

" Bash like keys for the command line
cnoremap <C-A>		<Home>
cnoremap <C-E>		<End>
cnoremap <C-K>		<C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>

" Map auto complete of (, ", ', [
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i
inoremap $t <><esc>i


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 缩写
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab time <c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Omni complete functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set omnifunc=syntaxcomplete#Complete
autocmd FileType css set omnifunc=csscomplete#CompleteCSS


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 简繁转换，要求有工具cconv
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 简体转繁体
command! G2b :%!cconv -f UTF8-CN -t UTF8-HK
" 繁体转简体
command! B2g :%!cconv -f UTF8-HK -t UTF8-CN


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 拼写检查
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ,sl 启动或关闭拼写检查
map <leader>sl :setlocal spell!<cr>

" 移到下一个拼写错误的单词
map <leader>sn ]s
" 移到上一个拼写错误的单词
map <leader>sp [s
" 告诉拼写检查器该单词是拼写正确的
map <leader>si zg
" 告诉拼写检查器该单词是拼写错误的
map <leader>sw zw
" 显示一个有关拼写错误单词的列表，可从中选择
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on 
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !isdirectory($HOME . "/.vim_temp_dir/undodir")
    call mkdir($HOME . "/.vim_temp_dir/undodir", "p")
endif
try
    set undodir=$HOME/.vim_temp_dirs/undodir
    set undofile
catch
endtry


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 如果只有一个缓冲区，就直接退出；否则，就只卸载当前缓冲区
function! CustomExit()
	if (winbufnr(2) == -1)
		q
	else
		bd
	endif
endfunction

func! DeleteTillSlash()
    let g:cmd = getcmdline()

    if g:ostype=='windows'
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
    else
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
    endif

    if g:cmd == g:cmd_edited
        if g:ostype=='windows'
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
        else
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
        endif
    endif   

    return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
    return a:cmd . " " . expand("%:p:h") . "/"
endfunc

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction 

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
