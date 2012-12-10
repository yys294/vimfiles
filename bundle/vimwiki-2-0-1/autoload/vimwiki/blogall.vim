"=============================================================================
"      FileName: blogall.vim
"   Description: 根据所有wiki生成主索引，以便发表为博客的首页
"        Author: 幽谷奇峰( https://twitter.com/yysfirecn )
"         Email: yysfire[at]gmail.com
"      HomePage: http://
"       Version: 2.0
"  Last Changed: 2012-12-07 14:39:22
"       History:
"=============================================================================

if !has('python')
    echo "Error: Required vim compiled with +python"
    finish
endif

" load only once {{{
if exists("g:loaded_vimwiki_blogall") || &cp
    finish
endif
let g:loaded_vimwiki_blogall = 1
" }}}

" 根据所有Wiki生成 wiki 的主页面
function! vimwiki#blogall#BuildIndex() " {{{
    let wikidir=expand(VimwikiGet('path'))
    let ext=expand(VimwikiGet('ext'))
python << EOF
#!/usr/bin/env python
# coding: utf-8

import os
from operator import itemgetter, attrgetter
from datetime import datetime
import re
import fnmatch


def GetFileList( rootdir, wikiext ):
    for root, dirs, files in os.walk(rootdir):
        if 'index'+wikiext in files:
            files.remove('index'+wikiext)
        if 'main'+wikiext in files:
            files.remove('main'+wikiext)
        if 'diary'+wikiext in files:
            files.remove('diary'+wikiext)
        for f in files:
            if fnmatch.fnmatch(f, '*'+wikiext):
                yield os.path.join(root, f)

def GetFileInfo( filepath ):
    reheader1=re.compile('^=')
    retitle=re.compile('(?<=%title\s).*')
    remtime=re.compile('(?<=Last\sModified:\s).*')
    rectime=re.compile('(?<=First\sCreated:\s).*')
    fobject = open(filepath,'r')
    filetitle=filemtime=filectime=''
    fileinfo=[]
    try:
        for line in fobject:
            title = retitle.search(line)
            if(title != None):
                filetitle=title.group(0)
            mtime = remtime.search(line)
            if(mtime != None):
                filemtime=mtime.group(0)
            ctime = rectime.search(line)
            if(ctime != None):
                filectime=ctime.group(0)
            header1 = reheader1.match(line)
            if(header1 != None):
                break
    finally:
        fobject.close()

    if(filemtime==''):
        filestats=os.stat(filepath)
        md=datetime.fromtimestamp(filestats.st_atime)
        filemtime=md.strftime('%Y-%m-%d %H:%M:%S')

    fileinfo.append(filectime)
    fileinfo.append(filemtime)
    fileinfo.append(filetitle)
    fileinfo.append(os.path.splitext(filepath)[0])
    yield fileinfo

def main():
    pathroot = vim.eval("wikidir")
    wikiext=vim.eval("ext")
    articlelist=[]
    for f in GetFileList(pathroot, wikiext):
        for finfo in GetFileInfo(f):
            articlelist.append(finfo)

    articlelist=sorted(articlelist, key=itemgetter(0), reverse=True)

    f=open(os.path.join(pathroot,'index'+wikiext),'wb')
    try:
        f.write('%title 幽谷奇峰—燕雀鸣幽谷，鸿鹄掠奇峰'+'\n')
        f.write('%template default_template'+'\n\n')
        f.write('= 幽谷奇峰—燕雀鸣幽谷，鸿鹄掠奇峰 ='+'\n')
        for article in articlelist:
            reflink=os.path.relpath(article[3],pathroot)
            f.write('== [[' + reflink + '|' + article[2] + ']] =='+'\n')
            f.write('- 最后修改： ' + article[1] + '\n')
            f.write('- 创作时间： ' + article[0] + '\n')
            f.write('\n')
    finally:
        f.close()

if __name__ == "__main__":
    main()
EOF
endfunction " }}}

" 生成 wiki 的主页面，同时也生成 html
function! vimwiki#blogall#BuildAll() " {{{
    call vimwiki#blogall#BuildIndex()
    call vimwiki#html#WikiAll2HTML(expand(VimwikiGet('path_html')))
endfunction " }}}

