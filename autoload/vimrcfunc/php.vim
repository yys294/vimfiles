"=============================================================================
"      FileName: php.vim
"   Description: 与php相关的自动调用函数
"        Author: 幽谷奇峰( https://twitter.com/yysfirecn )
"         Email: yysfire[at]gmail.com
"      HomePage: http://yysfire.github.com
"       Version: 1.0
"  Last Changed: 2012-12-10 08:45:45
"       History:
"=============================================================================
" Check the syntax of a PHP file
function vimrcfunc#php#CheckPHPSyntax()
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
function vimrcfunc#php#ExecutePHPScript()
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
function vimrcfunc#php#PHPSandBox()
    let tmpfile = tempname().'.php'
    exe 'new '.tmpfile
    call setline('.', '<?php')
    normal o
    normal o
    call setline('.', '?>')
    normal k
    startinsert
endfunction
