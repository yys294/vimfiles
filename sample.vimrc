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
