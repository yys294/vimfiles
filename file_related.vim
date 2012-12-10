"=============================================================================
"      FileName: file_related.vim
"   Description: 与指定文件相关的配置，请确保至少已加载 basic.vim
"        Author: 幽谷奇峰( https://twitter.com/yysfirecn )
"         Email: yysfire[at]gmail.com
"      HomePage: http://
"       Version: 6.0
"  Last Changed: 2012-12-10 09:43:14
"       History:
"=============================================================================
""""""""""""""""""""""""""""""
" => 根据文件扩展名载入模板文件
""""""""""""""""""""""""""""""
" 禁用，已安装load_template插件
"au! BufNewFile * silent! 0r $VIMFILES/templates/template.%:e

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
au FileType python setlocal foldlevel=99
au FileType python setlocal omnifunc=pythoncomplete#Complete

au FileType python inoremap <buffer> $r return 
au FileType python inoremap <buffer> $i import 
au FileType python inoremap <buffer> $p print 
au FileType python inoremap <buffer> $f #--- PH ----------------------------------------------<esc>FP2xi
au FileType python map <buffer> <leader>1 /class 
au FileType python map <buffer> <leader>2 /def 
au FileType python map <buffer> <leader>3 ?class 
au FileType python map <buffer> <leader>4 ?def 

" Check the syntax of a python file
au filetype python map <F5> :call vimrcfunc#python#CheckPythonSyntax()<CR>
au filetype python imap <F5> <ESC>:call vimrcfunc#python#CheckPythonSyntax()<CR>

" Run a python script
au filetype python map <C-F5> :call vimrcfunc#python#ExecutePythonScript()<CR>
au filetype python imap <C-F5> <ESC>:call vimrcfunc#python#ExecutePythonScript()<CR>

" Open a temporary Python file in a new window
nmap <leader>sbpy :call vimrcfunc#python#PySandBox()<CR>


""""""""""""""""""""""""""""""
" => C&C++ section
""""""""""""""""""""""""""""""
au filetype c,cpp map <F12> :call vimrcfunc#cpp#Do_CsTag()<CR>

"set tags+=./../tags,./../**/tags
if(g:ostype=='windows')
    au FileType cpp,c set tags+=$vim\mingwtags
endif

au filetype c,cpp map cta :call vimrcfunc#cpp#Man_Add_tags()<CR>
au filetype c,cpp map ctd :call vimrcfunc#cpp#Man_Del_tags()<CR>

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
"au FileType javascript call vimrcfunc#javascript#JavaScriptFold()
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
" Open a temporary PHP file in a new window
nmap <leader>sbph :call vimrcfunc#php#PHPSandBox()<CR>

" Check the syntax of a PHP file
au filetype php map <F5> :call vimrcfunc#php#CheckPHPSyntax()<CR>
au filetype php imap <F5> <ESC>:call vimrcfunc#php#CheckPHPSyntax()<CR>

" Run a PHP script
au filetype php map <C-F5> :call vimrcfunc#php#ExecutePHPScript()<CR>
au filetype php imap <C-F5> <ESC>:call vimrcfunc#php#ExecutePHPScript()<CR>

