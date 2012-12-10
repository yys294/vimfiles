"=============================================================================
"      FileName: javascript.vim
"   Description: 与javascript相关的自动调用函数
"        Author: 幽谷奇峰( https://twitter.com/yysfirecn )
"         Email: yysfire[at]gmail.com
"      HomePage: http://yysfire.github.com
"       Version: 1.0
"  Last Changed: 2012-12-10 08:49:52
"       History:
"=============================================================================
function! vimrcfunc#javascript#JavaScriptFold()
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction

