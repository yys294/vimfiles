" use vimwiki to blog
" vim: foldmethod=marker

" load only once {{{
if exists("g:loaded_vimwiki_blog_auto") || &cp
    finish
endif
let g:loaded_vimwiki_blog_auto = 1
" }}}

" 根据日记生成 wiki 的主页面
function! vimwiki#blog#BuildIndex() " {{{
    let files = s:allDiaryFiles()
    let list = ['%template default_template', '']
    
    for file in files
        let info = s:getFileInfo(expand(file))
        let lines = s:getIndexLines(info)
        call extend(list, lines)
        call add(list, '')
    endfor
    
    call s:buildIndex(list)
endfunction " }}}

" 生成 wiki 的主页面，同时也生成 html
function! vimwiki#blog#BuildAll() " {{{
    call vimwiki#blog#BuildIndex()
    call vimwiki#html#WikiAll2HTML(expand(VimwikiGet('path_html')))
endfunction " }}}


" 获取日记文件，并按时间先后排序，最新的排在前面
function! s:allDiaryFiles() " {{{
    let path = expand(VimwikiGet('path'))
    let files = split(glob(path . VimwikiGet('diary_rel_path') . "[[:digit:]]*" . VimwikiGet('ext')), '\n')
    call sort(files)
    call reverse(files)
    return files
endfunction " }}}

" 获取日记文件的信息：
"   date : 日期(文件名) 
"   title : 标题(文件内前 5 行指定的 title，没有指定的话就是文件名)
function! s:getFileInfo(path) " {{{
    let result = {}
    let result.date = fnamemodify(a:path, ':t:r')
    let result.title = result.date

    let lines = readfile(a:path, '', 5)
    for line in lines
        if line =~ '^%title '
            let result.title = strpart(line, strlen('%title '))
            break
        endif
    endfor

    return result
endfunction " }}}

" 根据日记文件的信息生成主页面的行
function! s:getIndexLines(info) " {{{
    let result = []
    call add(result, "== [[" . VimwikiGet('diary_rel_path') . a:info.date . "|" . a:info.title . "]] ==")
    call add(result, a:info.date)
    return result
endfunction " }}}

" 将拼好的列表写入主页面
function! s:buildIndex(list) " {{{
    let path = expand(VimwikiGet('path'))
    "let file = path . VimwikiGet('index') . VimwikiGet('ext')
    let file = path . 'index' . VimwikiGet('ext')
    call writefile(a:list, file)
endfunction " }}}
