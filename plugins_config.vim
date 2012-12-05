"=============================================================================
"      FileName: plugins_config.vim
"   Description: 插件的相关配置，请确保至少已加载 basic.vim
"        Author: 幽谷奇峰( https://twitter.com/yysfirecn )
"         Email: yysfire[at]gmail.com
"      HomePage: http://
"       Version: 6.0
"  Last Changed: 2012-12-05 11:32:09
"       History:
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => pathogen plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect() "添加bundle/下的子目录为runtimepath
call pathogen#infect('doc') "添加doc/下的子目录为runtimepath
if g:ostype=='unix'
    call pathogen#infect('linux') "使用pathogen.vim管理插件
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The other color schemes setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colors-solarized
"set background=dark     "dark blue background
"set background=light    "light yellow background
"colorscheme solarized

" colors-jellybeans, dark color scheme, inspired by ir_black and twilight
"colorscheme jellybeans

" colors-lucius
"colors lucius
"LuciusDarkHighContrast
"LuciusBlack
"LuciusLight
"LuciusWhite

" colors-harlequin
" Dark, high contrast, warm colorscheme for gvim and 256 color terminal inspired by molokai and badwolf
colors harlequin


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" statusline setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"autocmd! ColorScheme *  source $VIMFILES/bundle/statusline/plugin/statusline.vim


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => bufExplorer plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:bufExplorerDefaultHelp=0
"let g:bufExplorerShowRelativePath=1
"let g:bufExplorerFindActive=1
"let g:bufExplorerSortBy='name'
"map <leader>be :BufExplorer<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" minibufexpl插件设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:miniBufExplSplitBelow=0
"let g:miniBufExplMoreThanOne=0
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplForceSyntaxEnable = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" buftabs设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""   Define this variable to make buftabs only print the filename of each buffer,
""   omitting the preceding directory name.
"let g:buftabs_only_basename=1

""   These strings are drawn around each tab as separators, the 'marker_modified'
""   symbol is used to denote a modified (unsaved) buffer.
"let g:buftabs_separator = "."
"let g:buftabs_marker_start = "["
"let g:buftabs_marker_end = "]"
"let g:buftabs_marker_modified = "*"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERD_tree 设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nmap <leader>ne :NERDTree<cr>
nmap <leader>nt :NERDTreeToggle<cr>
nmap <leader>nb :NERDTreeFromBookmark
nmap <leader>nf :NERDTreeFind<cr>
" Open a NERDTree automatically when vim starts up if no files were specified
autocmd vimenter * if !argc() | NERDTree | endif
" Open a NERDTree automatically when vim starts up
"autocmd vimenter * NERDTree
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType")
            \ && b:NERDTreeType == "primary") | q | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CtrlP plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPBuffer'
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\.git$\|\.hg$\|\.svn$',
            \ 'file': '\.exe$\|\.so$\|\.dll$',
            \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
            \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => taglist setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Ctags_Cmd = 'ctags'
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1
let Tlist_GainFocus_On_ToggleOpen = 1
"让当前不被编辑的文件的方法列表自动折叠起来
let Tlist_File_Fold_Auto_Close=1
"启动vim自动打开taglist
"let Tlist_Auto_Open=1
nmap <silent> <leader>tl :TlistToggle<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => pydiction设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:pydiction_location = '$VIMFILES/bundle/pydiction-1.2/complete-dict'


"设置a51 文件语法高亮
autocmd BufEnter,WinEnter,BufNewFile,BufRead *.a51 setlocal filetype=a51


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"设置TxtBrowser 插件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufEnter,WinEnter,BufNewFile,BufRead *.txt setlocal ft=txt


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"设置ColorV插件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Auto Preview color-text in *.css files.  Auto update view after write file.
"let g:ColorV_prev_css=1
let g:colorv_preview_ftype = 'css,html,javascript,vim'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"设置grep插件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set grepprg=grep\ -nH
let Grep_Default_Options = '-i'
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn .git'
let Grep_OpenQuickfixWindow = 1
nnoremap <silent> <C-F3> :Grep<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"设置authorinfo插件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimrc_author='幽谷奇峰( https://twitter.com/yysfirecn )'
let g:vimrc_email='yysfire[at]gmail.com'
let g:vimrc_homepage='http://'
nmap <F4> :AuthorInfoDetect<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"设置mark插件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:mwDefaultHighlightingPalette = 'extended'
nmap <Leader>M <Plug>MarkToggle
nmap <Leader>N <Plug>MarkAllClear


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"设置vimwiki插件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au filetype vimwiki map <F5> :Vimwiki2HTML<cr>
au filetype vimwiki map <C-F5> :Vimwiki2HTMLBrowse<cr>
au filetype vimwiki map <F6> :VimwikiAll2HTML<cr>
au filetype vimwiki setl tw=0

" 多个维基项目的配置
let wiki_1 = {}
let wiki_1.path = '$VIMHOME/VimWiki/public/wiki/'
let wiki_1.path_html = '$VIMHOME/VimWiki/public/html/'
let wiki_1.template_path = '$VIMHOME/VimWiki/public/wiki/template/'
let wiki_1.template_default = 'default_template'
let wiki_1.template_ext = '.html'
let wiki_1.nested_syntaxes = {'asm': 'asm', 'c': 'c', 'cpp': 'cpp',
            \ 'css': 'css', 'js': 'javascript',
            \ 'perl': 'perl', 'python': 'python', 'java': 'java',
            \ 'php': 'php', 'html': 'html', 'bash': 'sh', 'vim': 'vim',
            \ 'make': 'make'}
let wiki_1.index = 'main'
let wiki_1.ext = '.wiki'

let wiki_2 = {}
let wiki_2.path = '$VIMHOME/VimWiki/private/wiki/'
let wiki_2.index = 'main'

let g:vimwiki_list = [wiki_1, wiki_2]

" 设置编码
let g:vimwiki_w32_dir_enc = 'utf-8'

" 使用鼠标映射
let g:vimwiki_use_mouse = 1

"Use VimwikiHeader1-VimwikiHeader6 group colors to highlight
let g:vimwiki_hl_headers=1

" Checked list items can be highlighted with a color
let g:vimwiki_hl_cb_checked = 1

" 我的 vim 是没有菜单的，加一个 vimwiki 菜单项也没有意义
let g:vimwiki_menu = ''

" 是否在计算字串长度时用特别考虑中文字符
let g:vimwiki_CJK_length = 1

" 声明可以在wiki里面使用的HTML标签
"let g:vimwiki_valid_html_tags='b,i,s,u,sub,sup,kbd,br,hr,div,del,code,red,center,left,right'
let g:vimwiki_valid_html_tags=''

" 'path_html'路径下的这些文件不会被命令:VimwikiAll2HTML自动删除
let g:vimwiki_user_htmls = '404.html,search.html'

" 从2级标题开始自动给标题编号
"let g:vimwiki_html_header_numbering=2
" 标题编号后跟')'
"let g:vimwiki_html_header_numbering_sym=' '

"let g:vimwiki_browsers=['firefox']

let g:vimwiki_ext2syntax = {'.md': 'markdown',
            \ '.mkd': 'markdown',
            \ '.wiki': 'media'}

"let g:vimwiki_dir_link='main'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"设置fcitx插件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if g:ostype=='unix'
    set ttimeoutlen=100
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"设置xptemplate插件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:xptemplate_key = '<TAB>'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => load_template plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:template_path = '$VIMFILES/template/'
nmap <leader>lt :LoadTemplate<CR>
