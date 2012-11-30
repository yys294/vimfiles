"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Important: 
"       This requries that you have sourced basic.vim
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GUI related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set background=dark

if has("gui_running")
    "colorscheme liquidcarbon
    colorscheme lucius
else
    "colorscheme ir_black
    colorscheme delek
    "colorscheme lucius
    "set t_Co=256
endif

" Set font according to system
if g:ostype=='mac'
    set gfn=Menlo:h14
    set shell=/bin/bash
elseif g:ostype=='windows'
    set guifont=YaHei_Consolas_Hybrid:h12:cANSI
    "set guifontwide=楷体_GB2312:h14:cGB2312
    "set guifontwide=宋体:h12:cGB2312
    "set guifontwide=隶书:h15:cGB2312
elseif g:ostype=='unix'
    set gfn=Monospace\ 12
    set shell=/bin/bash
endif


if g:ostype=='windows' && has('gui_running')
    let g:ScreenFlag = "Nomal"
    function! ToggleScreen()
        if g:ScreenFlag == "Max"
            let g:ScreenFlag = "Full"
            simalt ~x
            call libcallnr("vimtweak.dll", "EnableCaption", 0)
        elseif g:ScreenFlag == "Full"
            let g:ScreenFlag = "Nomal"
            call libcallnr("vimtweak.dll", "EnableCaption", 1)
            simalt ~r
        else
            let g:ScreenFlag = "Max"
            simalt ~x
        endif
    endfunction
    "F11 键使gvim 在全屏和普通模式间切换
    map <F11> :call ToggleScreen()<CR>
    imap <F11> <Esc>:call ToggleScreen()<CR>
    map <C-F11> :call libcallnr("vimtweak.dll", "SetAlpha", 200)<CR>
    map <S-F11> :call libcallnr("vimtweak.dll", "SetAlpha", 255)<CR>
endif

" Open MacVim in fullscreen mode
if has("gui_macvim")
    set fuoptions=maxvert,maxhorz
    au GUIEnter * set fullscreen
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fast editing and reloading of vimrc configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if g:ostype=='unix'
    "Fast reloading of the .vimrc
    map <silent> <leader>ss :source ~/.vimrc<cr>
    "Fast editing of .vimrc
    map <silent> <leader>ee :e ~/.vimrc<cr>
    "When .vimrc is edited, reload it
    autocmd! bufwritepost .vimrc source ~/.vimrc
elseif g:ostype=='windows'
    "Fast reloading of the _vimrc
    map <silent> <leader>ss :source $VIM/_vimrc<cr>
    "Fast editing of _vimrc
    map <silent> <leader>ee :e $VIM/_vimrc<cr>
    "When _vimrc is edited, reload it
    autocmd! bufwritepost _vimrc source $VIM/_vimrc
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自动更新文件的最后更新时间
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufWritePre,FileWritePre *.{cpp,h,py,c,cc,hpp,vim,cxx,wiki},*vimrc call AutoUpdateTheLastUpdateInfo()
function! AutoUpdateTheLastUpdateInfo()
	let s:original_pos = getpos(".")
	let s:regexp = "^\\s*\\([#\\\"\\*]\\|\\/\\/\\)\\s\\+[lL]ast \\([uU]pdated\\|[cC]hanged\\|[mM]odified\\):"
	let s:lu = search(s:regexp)
	if s:lu != 0
		let s:update_str = matchstr(getline(s:lu), s:regexp)
		call setline(s:lu, s:update_str . strftime(" %Y-%m-%d %H:%M"))
		call setpos(".", s:original_pos)
	endif
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on 
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !isdirectory($HOME . "/.vim_temp_dir/undodir")
    call mkdir($HOME . "/.vim_temp_dir/undodir", "p")
endif
try
    set undodir=$HOME/.vim_temp_dirs/undodir
    set undofile
catch
endtry


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart mappings on the command line
cno $h e ~/
cno $d e ~/Desktop/
cno $j e ./
cno $c e <C-\>eCurrentFileDir("e")<cr>

" $q is super useful when browsing on the command line
" it deletes everything until the last slash 
cno $q <C-\>eDeleteTillSlash()<cr>

" Bash like keys for the command line
cnoremap <C-A>		<Home>
cnoremap <C-E>		<End>
cnoremap <C-K>		<C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>

" Map auto complete of (, ", ', [
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i
inoremap $t <><esc>i


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General abbreviations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab time <c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Omni complete functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set omnifunc=syntaxcomplete#Complete
autocmd FileType css set omnifunc=csscomplete#CompleteCSS


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 简繁转换，要求有工具cconv
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command G2b :%!cconv -f UTF8-CN -t UTF8-HK
command B2g :%!cconv -f UTF8-HK -t UTF8-CN


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! DeleteTillSlash()
    let g:cmd = getcmdline()

    if g:ostype=='windows'
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
    else
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
    endif

    if g:cmd == g:cmd_edited
        if g:ostype=='windows'
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
        else
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
        endif
    endif   

    return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
    return a:cmd . " " . expand("%:p:h") . "/"
endfunc
