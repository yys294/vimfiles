set nocompatible

"No sound on errors.
set noerrorbells
set novisualbell
set t_vb=


"Set mapleader
let mapleader = ","
let g:mapleader = ","

" ���ֻ��һ�����ڣ���ôֱ���˳�
function! CustomExit()
	if (winbufnr(2) == -1)
		q
	else
		bd
	endif
endfunction


"Fast saving
nmap <silent> <leader>sa :w<cr>
nmap <silent> <leader>sf :w!<cr>

"Fast quiting
nmap <Leader>qw :w<CR><Esc>:call CustomExit()<CR>
nmap <Leader>qq :call CustomExit()<CR>
nmap <Leader>qf <Esc>:call CustomExit()!<CR>
nmap <silent> <leader>qa :qa<cr>
nmap <silent> <leader>qwa :w<CR><Esc>:qa<cr>

"Fast redraw ˢ��
nmap <silent> <leader>rr :redraw!<cr>

"Smart way to move between windows
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

"Tab configuration
map <leader>tn :tabn<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>tp :tabp<cr>
try
    set switchbuf=useopen
    set stal=1
catch
endtry


"Switch to current dir
map <silent> <leader>ccd :cd %:p:h<cr>
"�Զ�����Vim�Ĺ���·��Ϊ��ǰ�ļ����ڵ��ļ���
autocmd BufEnter * lcd %:p:h


if(has("win32") || has("win95") || has("win64") || has("win16")) "�ж���ǰ����ϵͳ����
    let g:iswindows=1
    let g:system_spliter='\'
else
    let g:iswindows=0
    let g:system_spliter='/'
endif


if (g:iswindows==1)
    source $VIMRUNTIME/mswin.vim
    behave mswin
endif


"��������
set encoding=utf-8
"chinese �Ǹ��������� Unix ���ʾ gb2312���� Windows ���ʾ cp936
set fileencodings=ucs-bom,utf-8,chinese
if (g:iswindows==1)
    set fenc=chinese
    set termencoding=chinese
else
    set fenc=utf-8
    set termencoding=utf-8
endif

if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
    set ambiwidth=double
endif

" Set helplang
set helplang=cn

if has("gui_running")
    set langmenu=zh_CN.utf-8
endif
language message zh_CN.utf-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fileformats
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Favorite filetypes
if (g:iswindows==1)
    set ffs=dos,unix
else
    set ffs=unix,dos
endif

nmap <leader>fd :se ff=dos<cr>
nmap <leader>fu :se ff=unix<cr>


"GUI and ColorScheme
if has("gui_running")
    set guioptions-=t "ȥ����˺�µĲ˵���
    set guioptions-=m "ȥ���˵���
    set guioptions-=T "ȥ��������
    set guioptions-=L "�д�ֱ�ָ�Ĵ���ʱ��ȥ����ߵĹ�����
    set guioptions-=r "ȥ���ұߵĹ�����
    colorscheme lucius
    "colorscheme darkblue_my
    "colorscheme desertEx
else
    colorscheme desertEx
endif " has

if has("gui_running")
    set lines=40
    set columns=120
    " Maximum window when GUI running ʹ��GVimʱ�������
    au GUIEnter * simalt ~x

    if g:iswindows==1
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
	"F11 ��ʹgvim ��ȫ������ͨģʽ���л�
	map <F11> :call ToggleScreen()<CR>
	imap <F11> <Esc>:call ToggleScreen()<CR>
    endif
endif

if has('gui_running') && has("win32")
    map <C-F11> :call libcallnr("vimtweak.dll", "SetAlpha", 200)<CR>
    map <S-F11> :call libcallnr("vimtweak.dll", "SetAlpha", 255)<CR>
endif


""""""""""""""""""""""""""""""
" Statusline
""""""""""""""""""""""""""""""
"Always have the statusline
set laststatus=2

"function! CurDir()
""��ǰ·�������е�/home/yys/���滻��~/,Ȼ�󷵻ظ�curdir
 "let curdir = substitute(getcwd(), '/home/yys/', '~/', 'g')
 "return curdir
"endfunction

"Format the statusline
"set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c

"set statusline=
"set statusline+=\ %F%m%r%h\ %w
"set statusline+=[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]
"set statusline+=[%{&ff}]%y\ \ Line:%l/%L=%p%%,Column:%c
"set statusline+=\ \ ASCII=\%b,HEX=\%B


"���������
if has("gui_running")
    if g:iswindows
	"set guifont=Consolas:h11:cANSI
	set guifont=YaHei_Consolas_Hybrid:h12:cANSI
	"set guifont=Inconsolata:h12:cANSI
	"set guifontwide=����_GB2312:h14:cGB2312
	"set guifontwide=������:h12:cGB2312
    else
	set guifont=Bitstream_Vera_Sans_Mono:h10:cANSI
    endif
endif

syntax on "���﷨����

set hlsearch "������ʾ���ҽ��
set incsearch "������Ҫ����������ʱ��vim��ʵʱƥ��
" ����ʱ���Դ�Сд��������һ�������ϴ�д��ĸʱ�Ա��ֶԴ�Сд����
set ignorecase smartcase

"show matching brackets
" ��������ʱ�����ݵ���ת��ƥ��Ķ�Ӧ���š�ֻ������Ļ���ܿ���ƥ��ʱ�Ż������ת
set showmatch


filetype plugin indent on "�����ļ���������

if has("autocmd")
    augroup vimrcEx
	au!
	autocmd FileType text setlocal textwidth=100
	"���ļ�����ת�������֪���ļ�λ��
	autocmd BufReadPost *
		    \ if line("'\"") > 1 && line("'\"") <= line("$") |
		    \ exe "normal! g`\"" |
		    \ endif
    augroup END
endif " has("autocmd")

set tabstop=8 "��һ��tab����8���ո�(ȱʡֵ)
set softtabstop=4 "ִ�б༭����������� <Tab> ����ʹ�� <BS> ʱ���� <Tab> ����4���ո�
set shiftwidth=4 "(�Զ�) ����ÿһ��ʹ�õĿհ���Ŀ������ 'cindent'��>>��<< �ȡ�
set expandtab

set autoindent
"set smartindent
set cindent

"��C++�������������������ڴ�����0���ַ���(ȱʡΪ'shiftwidth')������������������"public:","protected:"����"private:"
set cinoptions=g0,t0,(0,u0,w1,m1

"��׼�� GNU �����������
"set cinoptions=>4,n-2,{2,^-2,:2,=2,g0,h2,p5,t0,+2,(0,u0,w1,m1 shiftwidth=2 tabstop=8

"Ĭ��ֵ
"set cinoptions=>s,e0,n0,f0,{0,}0,^0,:s,=s,l0,b0,g0,hs,ps,t0,is,+s,c3,C0,/0,(2s,us,U0,w0,W0,m0,M0,j0,)20,*30,#0


set wrap "�Զ�����
set backspace=indent,eol,start whichwrap+=<,>,[,] "�����˸����ʹ��
"Set to auto read when a file is changed from the outside
set autoread


"��������ʹ��
if has('mouse')
    set mouse=a
endif


"Fast Ex command
nnoremap ; :

"The commandbar is 4 lines high
set cmdheight=4

"Show line number
set nu

"Do not redraw, when running macros.. lazyredraw
"set lz

"ѡ��һ�����ֲ�ȫ�������������
vnoremap  *  y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
vnoremap  #  y?<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>

" Remove trailing whitespace when writing a buffer, but not for diff files.
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
"autocmd BufWritePre * call RemoveTrailingWhitespace()
nmap <leader>rmw :call RemoveTrailingWhitespace()<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files and backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("vms")
    set nobackup          " do not keep a backup file, use versions instead
else
    set backup            " keep a backup file
endif

if !isdirectory($HOME . "/vimbackupfiles")
    call mkdir($HOME . "/vimbackupfiles", "p")
endif

"���ñ����ļ���Ŀ¼
set backupdir=$HOME/vimbackupfiles
"���ý����ļ���Ŀ¼
set directory=$HOME/vimbackupfiles
"�����ļ��ĺ�׺��Ĭ�ϵ�~��Ϊ".bak"
set backupext=.bak
"�������ļ�������ʱ������Ϳ�ʵ�ֶ�汾����
au BufWritePre * let &bex = '-' . strftime("%Y%m%d-%H%M%S") . '.bak'
"�ڵ�ǰĿ¼�������༭�ļ���ԭʼ����
"set patchmode=.orig


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ���������Զ����������ڵ�Ŀ¼
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup AutoMkdir
    autocmd!
    autocmd  BufNewFile  *  :call EnsureDirExists()
augroup END
function! EnsureDirExists ()
    let required_dir = expand("%:h")
    if !isdirectory(required_dir)
	call AskQuit("Directory '" . required_dir . "' doesn't exist.", "&Create it?")

	try
	    call mkdir( required_dir, 'p' )
	catch
	    call AskQuit("Can't create '" . required_dir . "'", "&Continue anyway?")
	endtry
    endif
endfunction

function! AskQuit (msg, proposed_action)
    if confirm(a:msg, "&Quit?\n" . a:proposed_action) == 1
	exit
    endif
endfunction

"Fast edit vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ���ٱ༭vimrc�ļ�
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if g:iswindows==0
    "Fast reloading of the .vimrc
    map <silent> <leader>ss :source ~/.vimrc<cr>
    "Fast editing of .vimrc
    map <silent> <leader>ee :e ~/.vimrc<cr>
    map <silent> <leader>v :e ~/.vim/gvimrc<cr>
    "map <silent> <leader>ee :call SwitchToBuf("~/.vimrc")<cr>
    if has('autocmd')
	"When .vimrc is edited, reload it
	autocmd! bufwritepost .vimrc source ~/.vimrc
    endif
else
    "Fast reloading of the _vimrc
    map <silent> <leader>ss :source $VIM/_vimrc<cr>
    "Fast editing of _vimrc
    map <silent> <leader>ee :e $VIM/_vimrc<cr>
    map <silent> <leader>v :e $VIM/vimfiles/gvimrc<cr>
    "map <silent> <leader>ee :call SwitchToBuf("$VIM/_vimrc")<cr>
    if has('autocmd')
	"When _vimrc is edited, reload it
	autocmd! bufwritepost _vimrc source $VIM/_vimrc
    endif
endif

"" Switch to buffer according to file name
"function! SwitchToBuf(filename)
    ""let fullfn = substitute(a:filename, "^\\~/", $HOME . "/", "")
    "" find in current tab
    "let bufwinnr = bufwinnr(a:filename)
    "if bufwinnr != -1
	"exec bufwinnr . "wincmd w"
	"return
    "else
	"" find in each tab
	"tabfirst
	"let tab = 1
	"while tab <= tabpagenr("$")
	    "let bufwinnr = bufwinnr(a:filename)
	    "if bufwinnr != -1
		"exec "normal " . tab . "gt"
		"exec bufwinnr . "wincmd w"
		"return
	    "endif
	    "tabnext
	    "let tab = tab + 1
	"endwhile
	"" not exist, new tab
	"exec "tabnew " . a:filename
    "endif
"endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :TOhtml ������йز�������
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"��ʹ��css
let g:html_use_css = 0
"����֧��
let g:html_use_encoding = "gb2312"
"ǿ��ȥ���к�
let g:html_number_lines = 0
"ǿ�Ʊ��кţ�����Ҫת�����������±�ţ�
"let g:html_number_lines = 1
"����Ĭ��number ѡ������
"unlet g:html_number_lines
"���Դ����۵�
let g:html_ignore_folding = 1
"��ʹ��xhtml
let g:use_xhtml = 0


" �Զ������ļ���������ʱ��
function! AutoUpdateTheLastUpdateInfo()
	let s:original_pos = getpos(".")
	let s:regexp = "^\\s*\\([#\\\"\\*]\\|\\/\\/\\)\\s\\+[lL]ast \\([uU]pdate\\|[cC]hange\\):"
	let s:lu = search(s:regexp)
	if s:lu != 0
		let s:update_str = matchstr(getline(s:lu), s:regexp)
		call setline(s:lu, s:update_str . strftime(" %c"))
		call setpos(".", s:original_pos)
	endif
endfunction
autocmd BufWritePre,FileWritePre *.{cpp,h,py,c},*vimrc call AutoUpdateTheLastUpdateInfo()

""""""""""""""""""""""""""""""""""""""""""""""
""omni completion 
""""""""""""""""""""""""""""""""""""""""""""""
"set completeopt=menu,longest
"set ofu=syntaxcomplete#Complete
"����ģʽ�°�`�����Զ���ȫ��tab����ѡ��
"imap <silent> ` <C-X><C-O>


" Check the syntax of a python file
function! CheckPythonSyntax()
    if &filetype != 'python'
        echohl WarningMsg | echo 'This is not a Python file !' | echohl None
        return
    endif
    setlocal makeprg=python\ -u\ %
    set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
    echohl WarningMsg | echo 'Syntax checking output:' | echohl None
    if &modified == 1
        silent write
    endif
    exec "silent make -c \"import py_compile;py_compile.compile(r'".bufname("%")."')\""
    clist
endfunction
au filetype python map <F5> :call CheckPythonSyntax()<CR>
au filetype python imap <F5> <ESC>:call CheckPythonSyntax()<CR>

"autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
"autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
"autocmd BufRead *.py nmap <F5> :!python %:t<CR>
"autocmd BufRead *.py nmap <S-F5> :!python %:t

" Run a python script
function! ExecutePythonScript()
    if &filetype != 'python'
        echohl WarningMsg | echo 'This is not a Python file !' | echohl None
        return
    endif
    setlocal makeprg=python\ -u\ %
    set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
    echohl WarningMsg | echo 'Execution output:' | echohl None
    if &modified == 1
        silent write
    endif
    silent make
    clist
endfunction
au filetype python map <C-F5> :call ExecutePythonScript()<CR>
au filetype python imap <C-F5> <ESC>:call ExecutePythonScript()<CR>

" Check the syntax of a PHP file
function! CheckPHPSyntax()
    if &filetype != 'php'
        echohl WarningMsg | echo 'This is not a PHP file !' | echohl None
        return
    endif
    setlocal makeprg=php\ -l\ -n\ -d\ html_errors=off\ %
    setlocal errorformat=%m\ in\ %f\ on\ line\ %l
    echohl WarningMsg | echo 'Syntax checking output:' | echohl None
    if &modified == 1
        silent write
    endif
    silent make
    clist
endfunction
au filetype php map <F5> :call CheckPHPSyntax()<CR>
au filetype php imap <F5> <ESC>:call CheckPHPSyntax()<CR>

" Run a PHP script
function! ExecutePHPScript()
    if &filetype != 'php'
        echohl WarningMsg | echo 'This is not a PHP file !' | echohl None
        return
    endif
    setlocal makeprg=php\ -f\ %
    setlocal errorformat=%m\ in\ %f\ on\ line\ %l
    echohl WarningMsg | echo 'Execution output:' | echohl None
    if &modified == 1
        silent write
    endif
    silent make
    clist
endfunction
au filetype php map <C-F5> :call ExecutePHPScript()<CR>
au filetype php imap <C-F5> <ESC>:call ExecutePHPScript()<CR>

" Open a temporary PHP file in a new window
function! PHPSandBox()
    let tmpfile = tempname().'.php'
    exe 'new '.tmpfile
    call setline('.', '<?php')
    normal o
    normal o
    call setline('.', '?>')
    normal k
    startinsert
endfunction
" Open a temporary Python file in a new window
function! PySandBox()
    let tmpfile = tempname().'.py'
    exe 'new '.tmpfile
    call setline('.', '#!/usr/bin/env python')
    normal o
    call setline('.', '# -*- coding: utf-8 -*-')
    normal o
    startinsert
endfunction
nmap <leader>sbpy :call PySandBox()<CR>
nmap <leader>sbph :call PHPSandBox()<CR>


map <F12> :call Do_CsTag()<CR>
function! Do_CsTag()
    let dir = getcwd()
    if filereadable("tags")
	if(g:iswindows==1)
	    let tagsdeleted=delete(dir."\\"."tags")
	else
	    let tagsdeleted=delete("./"."tags")
	endif
	if(tagsdeleted!=0)
	    echohl WarningMsg | echo "Fail to do tags! I cannot delete the tags" | echohl None
	    return
	endif
    endif
    if(executable('ctags'))
	"silent! execute "!ctags -R --c-types=+p --fields=+S *"
	silent! execute "!ctags -R --c++-kinds=+px --fields=+ialS --extra=+q ."
    endif
    "if has("cscope")
	"silent! execute "cs kill -1"
    "endif
    if filereadable("cscope.files")
	if(g:iswindows==1)
	    let csfilesdeleted=delete(dir."\\"."cscope.files")
	else
	    let csfilesdeleted=delete("./"."cscope.files")
	endif
	if(csfilesdeleted!=0)
	    echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.files" | echohl None
	    return
	endif
    endif
    if filereadable("cscope.out")
	if(g:iswindows==1)
	    let csoutdeleted=delete(dir."\\"."cscope.out")
	else
	    let csoutdeleted=delete("./"."cscope.out")
	endif
	if(csoutdeleted!=0)
	    echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.out" | echohl None
	    return
	endif
    endif
    if(executable('cscope') && has("cscope") )
	if(g:iswindows!=1)
	    silent! execute "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > cscope.files"
	else
	    silent! execute "!dir /s/b *.c,*.cpp,*.h,*.java,*.cs > cscope.files"
	endif
	silent! execute "!cscope -bCkq -i cscope.files"
	execute "normal :"

	if filereadable("cscope.out")
	    execute "cs add cscope.out"
	    " else add database pointed to by environment
	elseif $CSCOPE_DB != ""
	    execute "cs add $CSCOPE_DB"
	endif
    endif
endfunction

"set tags+=./../tags,./../**/tags
if(g:iswindows==1)
    au FileType cpp,c set tags+=$vim\vimfiles\mingwtags
endif

map cta :call Man_Add_tags()<CR>
map ctd :call Man_Del_tags()<CR>
function! Man_Add_tags()
    let dir =expand("%:p:h")
    let curtags = dir.g:system_spliter."tags"
    let curtags=substitute(curtags,'\\','\','g')
    if filereadable(curtags)
	exec "set tags+=".curtags
	echohl WarningMsg | echo "Succ to add tags![".curtags."]" | echohl None
    else
	echohl WarningMsg | echo "Fail to add tags! No tags in this file's path.[".curtags."]" | echohl None
    endif
endfunction
function! Man_Del_tags()
    let dir =expand("%:p:h")
    let curtags = dir.g:system_spliter."tags"
    let curtags=substitute(curtags,'\\','\','g')
    exec "set tags-=".curtags
    if filereadable(curtags)
	echohl WarningMsg | echo "Succ to del tags![".curtags."]" | echohl None
    else
	echohl WarningMsg | echo "Succ to del tags! But no tags in this file's path.[".curtags."]" | echohl None
    endif
endfunction

if has("cscope")
    set cscopequickfix=s-,c-,d-,i-,t-,e-
    set csto=0
    set cst
    set nocsverb
    if filereadable("cscope.out")
	execute "cs add cscope.out"
	" else add database pointed to by environment
    elseif $CSCOPE_DB != ""
	execute "cs add $CSCOPE_DB"
    endif
    set csverb

    map <C-_> :cstag <C-R>=expand("<cword>")<CR><CR>

    map g<C-]> :cs find 3 <C-R>=expand("<cword>")<CR><CR>
    map g<C-\> :cs find 0 <C-R>=expand("<cword>")<CR><CR>

    nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" �������
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call pathogen#infect() "ʹ��pathogen.vim������

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" minibufexpl�������
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:miniBufExplSplitBelow=0
"let g:miniBufExplSplitToEdge = 1
"let g:miniBufExplMaxSize = 3

"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 0
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1

"let g:miniBufExplMoreThanOne=1
"let g:miniBufExplForceSyntaxEnable = 1

"hi MBEChanged guibg=darkblue ctermbg=darkblue

"nnoremap <leader>bn :MBEbn<cr>
"nnoremap <leader>bp :MBEbp<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" buftabs����
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <leader>bp :bprev!<CR>
noremap <leader>bn :bnext!<CR>
"   Define this variable to make buftabs only print the filename of each buffer,
"   omitting the preceding directory name.
let g:buftabs_only_basename=1

"   Define this variable to make the plugin show the buftabs in the statusline
"   instead of the command line. It is a good idea to configure vim to show
"   the statusline as well when only one window is open.
"   set laststatus=2
"let g:buftabs_in_statusline=1
"   By default buftabs will take up the whole of the left-aligned section of
"   your statusline. You can alternatively specify precisely where it goes
"   using %{buftabs#statusline()} e.g.:
"set statusline=%{buftabs#statusline()}
"set statusline+=[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]
"set statusline+=[%{&ff}]%y\ \ Line:%l/%L=%p%%,Column:%c
"set statusline+=\ \ ASCII=\%b,HEX=\%B
"
"   The name of a highlight group (:help highligh-groups) which is used to
"   show the name of the current active buffer and of all other inactive
"   buffers. If these variables are not defined, no highlighting is used.
"   (Highlighting is only functional when g:buftabs_in_statusline is enabled)
"let g:buftabs_active_highlight_group="Title"
"
"   These strings are drawn around each tab as separators, the 'marker_modified'
"   symbol is used to denote a modified (unsaved) buffer.
let g:buftabs_separator = "."
let g:buftabs_marker_start = "["
let g:buftabs_marker_end = "]"
let g:buftabs_marker_modified = "*"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERD_tree ����
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <leader>ft :NERDTree<cr>

""""""""""""""""""""""""""""""
" taglist setting
""""""""""""""""""""""""""""""
let Tlist_Ctags_Cmd = 'ctags'
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1
let Tlist_GainFocus_On_ToggleOpen = 1
"�õ�ǰ�����༭���ļ��ķ����б��Զ��۵�����
let Tlist_File_Fold_Auto_Close=1
"����vim�Զ���taglist
"let Tlist_Auto_Open=1
nmap <silent> <leader>tl :TlistToggle<cr>

""""""""""""""""""""""""""""""
" Source Explorer setting
""""""""""""""""""""""""""""""
nmap <leader>se :SrcExplToggle<CR>
" // Set the height of Source Explorer window 
let g:SrcExpl_winHeight = 8 
" // Set 100 ms for refreshing the Source Explorer 
let g:SrcExpl_refreshTime = 100 
" // Set "Enter" key to jump into the exact definition context 
let g:SrcExpl_jumpKey = "<ENTER>" 
" // Set "Space" key for back from the definition context 
let g:SrcExpl_gobackKey = "<SPACE>" 
" // In order to Avoid conflicts, the Source Explorer should know what plugins 
" // are using buffers. And you need add their bufname into the list below 
" // according to the command ":buffers!" 
let g:SrcExpl_pluginList = [ 
        \ "__Tag_List__", 
        \ "_NERD_tree_", 
        \ "Source_Explorer" 
    \ ] 
" // Enable/Disable the local definition searching, and note that this is not 
" // guaranteed to work, the Source Explorer doesn't check the syntax for now. 
" // It only searches for a match with the keyword according to command 'gd' 
"let g:SrcExpl_searchLocalDef = 1 
" // Do not let the Source Explorer update the tags file when opening 
let g:SrcExpl_isUpdateTags = 0 
" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to 
" //  create/update a tags file 
"let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ." 
" // Set "<F12>" key for updating the tags file artificially 
"let g:SrcExpl_updateTagsKey = "<F12>"

""""""""""""""""""""""""""""""
" trinity setting
""""""""""""""""""""""""""""""
" Open and close all the three plugins on the same time 
"nmap <leader>tt  :TrinityToggleAll<CR> 
" Open and close the srcexpl.vim separately 
"nmap <leader>se  :TrinityToggleSourceExplorer<CR> 
" Open and close the taglist.vim separately 
"nmap <leader>tl  :TrinityToggleTagList<CR> 
" Open and close the NERD_tree.vim separately 
"nmap <leader>ft  :TrinityToggleNERDTree<CR>

""""""""""""""""""""""""""""""
" statusline setting
""""""""""""""""""""""""""""""
if g:iswindows==1
    autocmd! ColorScheme *  source $VIM\vimfiles\bundle\statusline\plugin\statusline.vim
else
    autocmd! ColorScheme *  source ~/.vim/bundle/statusline/plugin/statusline.vim
endif

""""""""""""""""""""""""""""""
" pydiction����
""""""""""""""""""""""""""""""
let g:pydiction_location = '$VIM\vimfiles\bundle\pydiction-1.2\complete-dict'

""""""""""""""""""""""""""""""
" omnicppcomplete ����
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
"����VimIM-Vim �������뷨
""""""""""""""""""""""""""""""
"let g:vimim_onekey_hit_and_run=0


"����a51 �ļ��﷨����
autocmd BufEnter,WinEnter,BufNewFile,BufRead *.a51 set filetype=a51

""""""""""""""""""""""""""""""
"����txt.vim ���: txt �ı�����
""""""""""""""""""""""""""""""
autocmd BufEnter,WinEnter,BufNewFile,BufRead *.txt set ft=txt
"autocmd filetype txt set syn=txt

""""""""""""""""""""""""""""""
"����ColorV���
""""""""""""""""""""""""""""""
"Auto Preview color-text in *.css files.  Auto update view after write file.
"let g:ColorV_prev_css=1

""""""""""""""""""""""""""""""
"����grep���
""""""""""""""""""""""""""""""
nnoremap <silent> <C-F3> :Grep<CR>

""""""""""""""""""""""""""""""
"����authorinfo���
""""""""""""""""""""""""""""""
let g:vimrc_author='YYS'
let g:vimrc_email='yysfire@126.com'
let g:vimrc_homepage='http://blog.163.com/yysfire@126'
nmap <F4> :AuthorInfoDetect<cr>

""""""""""""""""""""""""""""""
"����supertab���
""""""""""""""""""""""""""""""
let g:SuperTabDefaultCompletionType = "context"

""""""""""""""""""""""""""""""
"����xptemplate���
""""""""""""""""""""""""""""""
"let g:xptemplate_nav_next = '<C-j>'
"let g:xptemplate_nav_prev = '<C-k>'
"let g:xptemplate_key = '<C-=>'

""""""""""""""""""""""""""""""
"����mark���
""""""""""""""""""""""""""""""
let g:mwDefaultHighlightingPalette = 'extended'
nmap <Leader>M <Plug>MarkToggle
nmap <Leader>N <Plug>MarkAllClear

""""""""""""""""""""""""""""""
"����vimwiki���
""""""""""""""""""""""""""""""
let g:vimwiki_use_mouse = 1

" ���ά����Ŀ������
let g:vimwiki_list = [{'path': 'E:/VimWiki/public/',
	    \ 'path_html': 'E:/VimWiki/public/html/',
	    \ 'html_header': 'E:/VimWiki/template/header.htm',
	    \ 'html_footer': 'E:/VimWiki/template/footer.htm',
	    \ 'nested_syntaxes': {'Asm': 'asm', 'C': 'c', 'C++': 'cpp', 'Perl': 'perl', 'Python': 'python', 'Java': 'java', 'PHP': 'php', 'HTML': 'html', 'Bash': 'sh', 'Vim': 'vim', 'Make': 'make'},
	    \ 'auto_export': 0,},
	    \{'path': 'E:/VimWiki/private/',
	    \ 'diary_link_count': 5},]

" �������û���˵�����ǲ�����ô��Ҫ�շ�Ӣ�ĳ�Ϊά������
let g:vimwiki_camel_case = 0

" ���Ϊ��ɵ� checklist ��Ŀ�����ر����ɫ
let g:vimwiki_hl_cb_checked = 1

" �ҵ� vim ��û�в˵��ģ���һ�� vimwiki �˵���Ҳû������
let g:vimwiki_menu = ''

" �Ƿ������﷨�۵�  �����ļ��Ƚ���
"let g:vimwiki_folding = 1

" �Ƿ��ڼ����ִ�����ʱ���ر��������ַ�
let g:vimwiki_CJK_length = 1

" ����������wiki����ʹ�õ�HTML��ǩ
let g:vimwiki_valid_html_tags='b,i,s,u,sub,sup,kbd,br,hr,div,del,code,red,center,left,right,h4,h5,h6'
