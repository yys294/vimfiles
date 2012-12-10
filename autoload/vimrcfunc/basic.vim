"=============================================================================
"      FileName: basic.vim
"   Description: basic.vim配置文件中要用到的自动调用函数
"        Author: 幽谷奇峰( https://twitter.com/yysfirecn )
"         Email: yysfire[at]gmail.com
"      HomePage: http://yysfire.github.com
"       Version: 1.0
"  Last Changed: 2012-12-10 09:56:54
"       History:
"=============================================================================
function! vimrcfunc#basic#EnsureDirExists ()
    let required_dir = expand("%:h")
    if !isdirectory(required_dir)
	call s:AskQuit("Directory '" . required_dir . "' doesn't exist.", "&Create it?")

	try
	    call mkdir( required_dir, 'p' )
	catch
	    call s:AskQuit("Can't create '" . required_dir . "'", "&Continue anyway?")
	endtry
    endif
endfunction

function! s:AskQuit (msg, proposed_action)
    if confirm(a:msg, "&Quit?\n" . a:proposed_action) == 1
	exit
    endif
endfunction
