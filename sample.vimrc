"=============================================================================
"      FileName: .vimrc
"   Description: 用于加载其它四个配置文件
"        Author: 幽谷奇峰( https://twitter.com/yysfirecn )
"         Email: yysfire[at]gmail.com
"      HomePage: http://
"       Version: 6.0
"  Last Changed: 2012-12-03 08:59:24
"       History:
"=============================================================================
" za                            --展开或收起当前折叠
" zi                            --展开或收起所有折叠
" zM                            --收起所有折叠：'foldlevel'设为0
" zR                            --展开所有折叠：'foldlevel'设为最高级别
"
" :%!xxd                        --转储二进制文件，以十六进制形式显示
" :%!xxd -r                     --还原二进制文件
"
" 判定当前操作系统类型
if(has("win32")||has("win95")||has("win64")||has("win16")||has("dos32")||has("dos16"))
    let g:ostype='windows'
    let g:system_spliter='\'
elseif(has("mac"))
    let g:ostype='mac'
    let g:system_spliter='/'
else
    let g:ostype='unix'
    let g:system_spliter='/'
endif

" 统一不同平台上的环境变量
if g:ostype=='windows'
    let $VIMHOME = $VIM
    let $VIMFILES = $VIM.'/vimfiles'
else
    let $VIMHOME = $HOME
    let $VIMFILES = $HOME.'/.vim'
endif

source $VIMFILES/basic.vim
source $VIMFILES/extended.vim
source $VIMFILES/file_related.vim
source $VIMFILES/plugins_config.vim

