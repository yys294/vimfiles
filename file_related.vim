"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Important: 
"       This requries that you have sourced basic.vim
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
" => 根据文件扩展名载入模板文件
""""""""""""""""""""""""""""""
au BufNewFile * silent 0r $VIMFILES/templates/template.%:e

""""""""""""""""""""""""""""""
" => html/xml section
""""""""""""""""""""""""""""""
au FileType html,xml setlocal sw=2

""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self
au FileType python setlocal et sta sw=4 sts=4 ts=4 tw=72
au FileType python set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
"以缩进为代码折叠的依据
"au FileType python map <buffer> F :setlocal foldmethod=indent<cr>
au FileType python setlocal foldmethod=indent
"默认展开所有代码
"au FileType python setlocal foldlevel=99
au FileType python setlocal omnifunc=pythoncomplete#Complete

au FileType python inoremap <buffer> $r return 
au FileType python inoremap <buffer> $i import 
au FileType python inoremap <buffer> $p print 
au FileType python inoremap <buffer> $f #--- PH ----------------------------------------------<esc>FP2xi
au FileType python map <buffer> <leader>1 /class 
au FileType python map <buffer> <leader>2 /def 
au FileType python map <buffer> <leader>C ?class 
au FileType python map <buffer> <leader>D ?def 

" Check the syntax of a python file
au filetype python map <F5> :call CheckPythonSyntax()<CR>
au filetype python imap <F5> <ESC>:call CheckPythonSyntax()<CR>
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

" Run a python script
au filetype python map <C-F5> :call ExecutePythonScript()<CR>
au filetype python imap <C-F5> <ESC>:call ExecutePythonScript()<CR>
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

" Open a temporary Python file in a new window
nmap <leader>sbpy :call PySandBox()<CR>
function! PySandBox()
    let tmpfile = tempname().'.py'
    exe 'new '.tmpfile
    call setline('.', '#!/usr/bin/env python')
    normal o
    call setline('.', '# -*- coding: utf-8 -*-')
    normal o
    startinsert
endfunction


""""""""""""""""""""""""""""""
" => C&C++ section
""""""""""""""""""""""""""""""
map <F12> :call Do_CsTag()<CR>
function! Do_CsTag()
    let dir = getcwd()
    if filereadable("tags")
	if(g:ostype=='windows')
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
	if(g:ostype=='windows')
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
	if(g:ostype=='windows')
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
	if(g:ostype!='windows')
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
if(g:ostype=='windows')
    au FileType cpp,c set tags+=$vim\mingwtags
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


""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent

au FileType javascript imap <c-t> AJS.log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi

au FileType javascript inoremap <buffer> $r return 
au FileType javascript inoremap <buffer> $f //--- PH ----------------------------------------------<esc>FP2xi

function! JavaScriptFold() 
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction


""""""""""""""""""""""""""""""
" => PHP section
"""""""""""""""""""""""""""""""
nmap <leader>sbph :call PHPSandBox()<CR>
" Check the syntax of a PHP file
au filetype php map <F5> :call CheckPHPSyntax()<CR>
au filetype php imap <F5> <ESC>:call CheckPHPSyntax()<CR>
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

" Run a PHP script
au filetype php map <C-F5> :call ExecutePHPScript()<CR>
au filetype php imap <C-F5> <ESC>:call ExecutePHPScript()<CR>
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
