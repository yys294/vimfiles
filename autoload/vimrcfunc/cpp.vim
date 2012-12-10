"=============================================================================
"      FileName: cpp.vim
"   Description: 与C和C++相关的自动调用函数
"        Author: 幽谷奇峰( https://twitter.com/yysfirecn )
"         Email: yysfire[at]gmail.com
"      HomePage: http://yysfire.github.com
"       Version: 1.0
"  Last Changed: 2012-12-10 09:02:39
"       History:
"=============================================================================
" 生成tags文件
function vimrcfunc#cpp#Do_CsTag()
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

" 手动添加当前目录的tags文件
function vimrcfunc#cpp#Man_Add_tags()
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

" 手动删除当前目录的tags文件
function vimrcfunc#cpp#Man_Del_tags()
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

