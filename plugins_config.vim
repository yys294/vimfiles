"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Important: 
"       This requries that you have sourced basic.vim
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" �������
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => pathogen plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect() "���bundle/�µ���Ŀ¼Ϊruntimepath
call pathogen#infect('doc') "���doc/�µ���Ŀ¼Ϊruntimepath
if g:ostype=='unix'
    call pathogen#infect('linux') "ʹ��pathogen.vim������
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
" minibufexpl�������
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
" buftabs����
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <leader>bp :bprev!<CR>
noremap <leader>bn :bnext!<CR>
"   Define this variable to make buftabs only print the filename of each buffer,
"   omitting the preceding directory name.
let g:buftabs_only_basename=1

"   Define this variable to make the plugin show the buftabs in the statusline
"   instead of the command line. It is a good idea to configure vim to show
"   the statusline as well when only one window is open.
"   set laststatus=2
"let g:buftabs_in_statusline=1
"   By default buftabs will take up the whole of the left-aligned section of
"   your statusline. You can alternatively specify precisely where it goes
"   using %{buftabs#statusline()} e.g.:
"set statusline=%{buftabs#statusline()}
"set statusline+=[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]
"set statusline+=[%{&ff}]%y\ \ Line:%l/%L=%p%%,Column:%c
"set statusline+=\ \ ASCII=\%b,HEX=\%B
"
"   The name of a highlight group (:help highligh-groups) which is used to
"   show the name of the current active buffer and of all other inactive
"   buffers. If these variables are not defined, no highlighting is used.
"   (Highlighting is only functional when g:buftabs_in_statusline is enabled)
"let g:buftabs_active_highlight_group="Title"
"
"   These strings are drawn around each tab as separators, the 'marker_modified'
"   symbol is used to denote a modified (unsaved) buffer.
let g:buftabs_separator = "."
let g:buftabs_marker_start = "["
let g:buftabs_marker_end = "]"
let g:buftabs_marker_modified = "*"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERD_tree ����
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nmap <leader>ne :NERDTree<cr>
nmap <leader>nt :NERDTreeToggle<cr>
nmap <leader>nb :NERDTreeFromBookmark 
nmap <leader>nf :NERDTreeFind<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" taglist setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Ctags_Cmd = 'ctags'
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1
let Tlist_GainFocus_On_ToggleOpen = 1
"�õ�ǰ�����༭���ļ��ķ����б��Զ��۵�����
let Tlist_File_Fold_Auto_Close=1
"����vim�Զ���taglist
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
if g:ostype=='windows'
    autocmd! ColorScheme *  source $VIM\vimfiles\bundle\statusline\plugin\statusline.vim
else
    autocmd! ColorScheme *  source ~/.vim/bundle/statusline/plugin/statusline.vim
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" pydiction����
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:pydiction_location = '$VIM\vimfiles\bundle\pydiction-1.2\complete-dict'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" omnicppcomplete ����
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"����VimIM-Vim �������뷨
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:vimim_onekey_hit_and_run=0


"����a51 �ļ��﷨����
autocmd BufEnter,WinEnter,BufNewFile,BufRead *.a51 setlocal filetype=a51

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"����TxtBrowser ���
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufEnter,WinEnter,BufNewFile,BufRead *.txt setlocal ft=txt

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"����ColorV���
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Auto Preview color-text in *.css files.  Auto update view after write file.
"let g:ColorV_prev_css=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"����grep���
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set grepprg=grep\ -nH
let Grep_Default_Options = '-i'
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn .git'
let Grep_OpenQuickfixWindow = 1
nnoremap <silent> <C-F3> :Grep<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"����authorinfo���
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimrc_author='YYS'
let g:vimrc_email='yysfire@126.com'
let g:vimrc_homepage='http://blog.163.com/yysfire@126'
nmap <F4> :AuthorInfoDetect<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"����supertab���
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:SuperTabDefaultCompletionType = "context"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"����xptemplate���
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:xptemplate_nav_next = '<C-j>'
"let g:xptemplate_nav_prev = '<C-k>'
"let g:xptemplate_key = '<C-=>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"����mark���
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:mwDefaultHighlightingPalette = 'extended'
nmap <Leader>M <Plug>MarkToggle
nmap <Leader>N <Plug>MarkAllClear

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"����vimwiki���
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimwiki_use_mouse = 1

" ���ά����Ŀ������
let g:vimwiki_list = [{'path': '~/VimWiki/public/',
            \ 'path_html': '~/VimWiki/public/html/',
	    \ 'html_header': '~/VimWiki/public/template/header.htm',
	    \ 'html_footer': '~/VimWiki/public/template/footer.htm',
	    \ 'nested_syntaxes': {'Asm': 'asm', 'C': 'c', 'C++': 'cpp',
            \ 'Perl': 'perl', 'Python': 'python', 'Java': 'java',
            \ 'PHP': 'php', 'HTML': 'html', 'Bash': 'sh', 'Vim': 'vim', 'Make': 'make'},
	    \ 'auto_export': 0,},
	    \{'path': '~/VimWiki/private/',
	    \ 'diary_link_count': 5},]

" �������û���˵�����ǲ�����ô��Ҫ�շ�Ӣ�ĳ�Ϊά������
let g:vimwiki_camel_case = 0

" ���Ϊ��ɵ� checklist ��Ŀ�����ر����ɫ
let g:vimwiki_hl_cb_checked = 1

" �ҵ� vim ��û�в˵��ģ���һ�� vimwiki �˵���Ҳû������
let g:vimwiki_menu = ''

" �Ƿ������﷨�۵�  �����ļ��Ƚ���
"let g:vimwiki_folding = 1

" �Ƿ��ڼ����ִ�����ʱ���ر��������ַ�
let g:vimwiki_CJK_length = 1

" ����������wiki����ʹ�õ�HTML��ǩ
let g:vimwiki_valid_html_tags='b,i,s,u,sub,sup,kbd,br,hr,div,del,code,red,center,left,right,h4,h5,h6'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"����fcitx���
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if g:ostype=='unix'
    set ttimeoutlen=100
endif

