"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Important: 
"       This requries that you have sourced basic.vim
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => pathogen plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect() "添加bundle/下的子目录为runtimepath
call pathogen#infect('doc') "添加doc/下的子目录为runtimepath
if g:ostype=='unix'
    call pathogen#infect('linux') "使用pathogen.vim管理插件
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => bufExplorer plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:bufExplorerDefaultHelp=0
"let g:bufExplorerShowRelativePath=1
"let g:bufExplorerFindActive=1
"let g:bufExplorerSortBy='name'
"map <leader>be :BufExplorer<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" minibufexpl插件设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:miniBufExplSplitBelow=0
"let g:miniBufExplSplitToEdge = 1
"let g:miniBufExplMaxSize = 3

"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 0
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1

"let g:miniBufExplMoreThanOne=1
"let g:miniBufExplForceSyntaxEnable = 1

"hi MBEChanged guibg=darkblue ctermbg=darkblue

"nnoremap <leader>bn :MBEbn<cr>
"nnoremap <leader>bp :MBEbp<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" buftabs设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <leader>bp :bprev!<CR>
noremap <leader>bn :bnext!<CR>
"   Define this variable to make buftabs only print the filename of each buffer,
"   omitting the preceding directory name.
let g:buftabs_only_basename=1

"   These strings are drawn around each tab as separators, the 'marker_modified'
"   symbol is used to denote a modified (unsaved) buffer.
let g:buftabs_separator = "."
let g:buftabs_marker_start = "["
let g:buftabs_marker_end = "]"
let g:buftabs_marker_modified = "*"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERD_tree 设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nmap <leader>ne :NERDTree<cr>
nmap <leader>nt :NERDTreeToggle<cr>
nmap <leader>nb :NERDTreeFromBookmark 
nmap <leader>nf :NERDTreeFind<cr>
" Open a NERDTree automatically when vim starts up if no files were specified
autocmd vimenter * if !argc() | NERDTree | endif
" Open a NERDTree automatically when vim starts up
"autocmd vimenter * NERDTree
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CtrlP plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPBuffer'
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\.git$\|\.hg$\|\.svn$',
            \ 'file': '\.exe$\|\.so$\|\.dll$',
            \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
            \ }
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" taglist setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Source Explorer setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>se :SrcExplToggle<CR>
" // Set the height of Source Explorer window 
let g:SrcExpl_winHeight = 8 
" // Set 100 ms for refreshing the Source Explorer 
let g:SrcExpl_refreshTime = 100 
" // Set "Enter" key to jump into the exact definition context 
let g:SrcExpl_jumpKey = "<ENTER>" 
" // Set "Space" key for back from the definition context 
let g:SrcExpl_gobackKey = "<SPACE>" 
" // In order to Avoid conflicts, the Source Explorer should know what plugins 
" // are using buffers. And you need add their bufname into the list below 
" // according to the command ":buffers!" 
let g:SrcExpl_pluginList = [ 
        \ "__Tag_List__", 
        \ "_NERD_tree_", 
        \ "Source_Explorer" 
    \ ] 
" // Enable/Disable the local definition searching, and note that this is not 
" // guaranteed to work, the Source Explorer doesn't check the syntax for now. 
" // It only searches for a match with the keyword according to command 'gd' 
"let g:SrcExpl_searchLocalDef = 1 
" // Do not let the Source Explorer update the tags file when opening 
let g:SrcExpl_isUpdateTags = 0 
" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to 
" //  create/update a tags file 
"let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ." 
" // Set "<F12>" key for updating the tags file artificially 
"let g:SrcExpl_updateTagsKey = "<F12>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" trinity setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open and close all the three plugins on the same time 
"nmap <leader>tt  :TrinityToggleAll<CR> 
" Open and close the srcexpl.vim separately 
"nmap <leader>se  :TrinityToggleSourceExplorer<CR> 
" Open and close the taglist.vim separately 
"nmap <leader>tl  :TrinityToggleTagList<CR> 
" Open and close the NERD_tree.vim separately 
"nmap <leader>ft  :TrinityToggleNERDTree<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" statusline setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd! ColorScheme *  source $VIMFILES\bundle\statusline\plugin\statusline.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" pydiction设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:pydiction_location = '$VIMFILES\bundle\pydiction-1.2\complete-dict'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" omnicppcomplete 设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"设置a51 文件语法高亮
autocmd BufEnter,WinEnter,BufNewFile,BufRead *.a51 setlocal filetype=a51

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"设置TxtBrowser 插件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufEnter,WinEnter,BufNewFile,BufRead *.txt setlocal ft=txt

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"设置ColorV插件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Auto Preview color-text in *.css files.  Auto update view after write file.
"let g:ColorV_prev_css=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"设置grep插件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set grepprg=grep\ -nH
let Grep_Default_Options = '-i'
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn .git'
let Grep_OpenQuickfixWindow = 1
nnoremap <silent> <C-F3> :Grep<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"设置authorinfo插件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimrc_author='YYS'
let g:vimrc_email='yysfire[at]gmail.com'
let g:vimrc_homepage='http://'
nmap <F4> :AuthorInfoDetect<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"设置supertab插件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:SuperTabDefaultCompletionType = "context"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"设置mark插件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:mwDefaultHighlightingPalette = 'extended'
nmap <Leader>M <Plug>MarkToggle
nmap <Leader>N <Plug>MarkAllClear

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"设置vimwiki插件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au filetype vimwiki map <F5> :VimWiki2HTML<cr>
au filetype vimwiki map <C-F5> :VimWiki2HTMLBrowse<cr>
au filetype vimwiki map <F6> :VimWikiAll2HTML<cr>

" 多个维基项目的配置
let g:vimwiki_list = [{'path': '$VIMHOME/VimWiki/public/',
            \ 'path_html': '$VIMHOME/VimWiki/public/html/',
            \ 'template_path': '$VIMHOME/VimWiki/public/template/',
            \ 'template_default': 'default_template',
            \ 'template_ext': '.html',
	    \ 'nested_syntaxes': {'asm': 'asm', 'c': 'c', 'c++': 'cpp',
            \ 'perl': 'perl', 'python': 'python', 'java': 'java',
            \ 'php': 'php', 'html': 'html', 'bash': 'sh', 'vim': 'vim', 'make': 'make'},
	    \ 'auto_export': 0,},
	    \{'path': '$VIMHOME/VimWiki/private/',
	    \ 'diary_link_count': 5},]

" 文件名中的空格将会替换成 g:vimwiki_stripsym 的值
" g:vimwiki_stripsym 缺省值为下划线
let g:vimwiki_badsyms = ' '

" 设置编码
let g:vimwiki_w32_dir_enc = 'utf-8'
 
" 使用鼠标映射
let g:vimwiki_use_mouse = 1

" 对中文用户来说，我们并不怎么需要驼峰英文成为维基词条
let g:vimwiki_camel_case = 0

" Checked list items can be highlighted with a color
let g:vimwiki_hl_cb_checked = 1

" 我的 vim 是没有菜单的，加一个 vimwiki 菜单项也没有意义
let g:vimwiki_menu = ''

" 是否在计算字串长度时用特别考虑中文字符
let g:vimwiki_CJK_length = 1

" 声明可以在wiki里面使用的HTML标签
let g:vimwiki_valid_html_tags='b,i,s,u,sub,sup,kbd,br,hr,div,del,code,red,center,left,right'

let g:vimwiki_file_exts='pdf,txt,doc,rtf,xls,ppt,php,html,zip,rar,7z,gz,bz2,xz'

" 'path_html'路径下的这些文件不会被命令:VimwikiAll2HTML自动删除
let g:vimwiki_user_htmls = '404.html,search.html'

" 从2级标题开始自动给标题编号
"let g:vimwiki_html_header_numbering=2
" 标题编号后跟')'
"let g:vimwiki_html_header_numbering_sym=' '

let g:vimwiki_browsers=['firefox.exe']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"设置fcitx插件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if g:ostype=='unix'
    set ttimeoutlen=100
endif

