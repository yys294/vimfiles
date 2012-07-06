"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: 
"       Amir Salihefendic
"       http://amix.dk - amix@amix.dk
"
" Version: 
"       5.0 - 29/05/12 15:43:36
"
" Blog_post: 
"       http://amix.dk/blog/post/19691#The-ultimate-Vim-configuration-on-Github
"
" Sections:
"    -> General
"    -> VIM user interface
"    -> GUI and Colors
"    -> Enconding, Fileformats
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> :TOhtml related
"    -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if(has("win32")||has("win95")||has("win64")||has("win16")||has("dos32")||has("dos16")) "�ж���ǰ����ϵͳ����
    let g:ostype='windows'
    let g:system_spliter='\'
elseif(has("mac"))
    let g:ostype='mac'
    let g:system_spliter='/'
else
    let g:ostype='unix'
    let g:system_spliter='/'
endif

if (g:ostype=='windows')
    source $VIMRUNTIME/mswin.vim
    behave mswin
endif

set nocompatible

" Sets how many lines of history VIM has to remember
set history=100

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

"Fast Ex command
nnoremap ; :

" Fast saving
nmap <silent> <leader>w :w<cr>
nmap <silent> <leader>wf :w!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Show line number
set nu

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*.obj,*~,*.pyc,*.pyo

"Always show current position
set ruler

" Height of the command bar
set cmdheight=4

" A buffer becomes hidden when it is abandoned
"set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,[,]

" Ignore case when searching
set ignorecase
" When searching try to be smart about cases 
" ����ʱ���ϴ�д��ĸʱ�Ա��ֶԴ�Сд����
set smartcase
" Highlight search results
set hlsearch
" Makes search act like search in modern browsers
"������Ҫ����������ʱ��vim��ʵʱƥ��
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
" ��������ʱ�����ݵ���ת��ƥ��Ķ�Ӧ���š�ֻ������Ļ���ܿ���ƥ��ʱ�Ż������ת
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GUI and Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable 
"syntax on

try
    colorscheme desert
catch
endtry

"set background=dark

if has("gui_running")
    set guioptions-=t "ȥ����˺�µĲ˵���
    "set guioptions-=m "ȥ���˵���
    set guioptions-=T "ȥ��������
    set guioptions-=L "�д�ֱ�ָ�Ĵ���ʱ��ȥ����ߵĹ�����
    set guioptions-=r "ȥ���ұߵĹ�����
    if has("windows")
        set guitablabel=%M\ %t
    endif
endif

if has("gui_running")
    set lines=40
    set columns=120
    " Maximum window when GUI running
    if g:ostype=='windows'
        au GUIEnter * simalt ~x
    endif
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Encoding, Fileformats
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
"chinese �Ǹ��������� Unix ���ʾ gb2312���� Windows ���ʾ cp936
set fileencodings=ucs-bom,utf-8,chinese
if (g:ostype=='windows')
    set fenc=chinese
    set termencoding=chinese
else
    set fenc=utf-8
    set termencoding=utf-8
endif

if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
    set ambiwidth=double
endif

" Set helplang
set helplang=cn

" ����˵�����
if has("gui_running")
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    set langmenu=zh_CN.utf-8
endif

language message zh_CN.utf-8

"Favorite fileformats
if g:ostype=='windows'
    set ffs=dos,unix,mac
elseif g:ostype=='unix'
    set ffs=unix,dos,mac
elseif g:ostype=='mac'
    set ffs=mac,unix,dos
endif

nmap <leader>fd :se ff=dos<cr>
nmap <leader>fu :se ff=unix<cr>
nmap <leader>fm :se ff=mac<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nowb
set noswapfile

if has("vms")
    set nobackup          " do not keep a backup file, use versions instead
else
    set backup            " keep a backup file
endif

if !isdirectory($HOME . "/.vim_temp_dir")
    call mkdir($HOME . "/.vim_temp_dir", "p")
endif

"���ñ����ļ���Ŀ¼
set backupdir=$HOME/.vim_temp_dir
"���ý����ļ���Ŀ¼
set directory=$HOME/.vim_temp_dir
"�����ļ��ĺ�׺��Ĭ�ϵ�~��Ϊ".bak"
set backupext=.bak
"�������ļ�������ʱ������Ϳ�ʵ�ֶ�汾����
au BufWritePre * let &bex = '-' . strftime("%Y%m%d-%H%M%S") . '.bak'
"�ڵ�ǰĿ¼�������༭�ļ���ԭʼ����
"set patchmode=.orig


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 1 tab == 4 spaces
set shiftwidth=4 "(�Զ�) ����ÿһ��ʹ�õĿհ���Ŀ������ 'cindent'��>>��<< �ȡ�
set tabstop=8
set softtabstop=4 "ִ�б༭����������� <Tab> ����ʹ�� <BS> ʱ���� <Tab> ����4���ո�

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs 
" ����򿪣����׵� <Tab> ���� 'shiftwidth' ����հס�'tabstop' ��
" 'softtabstop' ���ڱ�ĵط���<BS> ɾ������ 'shiftwidth' ��ô��Ŀհס�
" ����رգ�<Tab> ���Ǹ��� 'tabstop' �� 'softtabstop' ��������հ׵���Ŀ
set smarttab


" Linebreak on 100 characters
"if has("linebreak")
    "set lbr
"endif
set tw=78
set formatoptions+=mM
au filetype txt,text setlocal formatoptions=aw2tqmM

set autoindent
"set smartindent
set cindent

"��C++�������������������ڴ�����0���ַ���(ȱʡΪ'shiftwidth')������������
"������"public:","protected:"����"private:"
set cinoptions=g0,t0,(0,u0,w1,m1

"��׼�� GNU �����������
"set cinoptions=>4,n-2,{2,^-2,:2,=2,g0,h2,p5,t0,+2,(0,u0,w1,m1 shiftwidth=2 tabstop=8

"Ĭ��ֵ
"set cinoptions=>s,e0,n0,f0,{0,}0,^0,:s,=s,l0,b0,g0,hs,ps,t0,is,+s,c3,C0,/0,(2s,us,U0,w0,W0,m0,M0,j0,)20,*30,#0


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>
""ѡ��һ�����ֲ�ȫ�������������
"vnoremap  *  y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
"vnoremap  #  y?<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
"map j gj
"map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
"map <space> /
"map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
"map <leader>ba :1,1000 bd!<cr>
map <leader>ba :1,1000 bd<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>
" �ر��������б�ǩ
map <leader>to :tabonly<cr>
" �ƶ���ǩ
map <leader>tm :tabmove 

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>
"�Զ�����Vim�Ĺ���·��Ϊ��ǰ�ļ����ڵ��ļ���
autocmd BufEnter * lcd %:p:h

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=1
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
"set viminfo^=%


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" Another status line style
set statusline=
set statusline+=\ %F%m%r%h\ %w%=
set statusline+=\ [%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}][%{&ff}]%y\ 
set statusline+=\ %l/%L=%p%%,%c\ 
set statusline+=\ %b,0x%B


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Remove trailing whitespace when writing a buffer, but not for diff files.
" From: Vigil
" @see http://blog.bs2.to/post/EdwardLee/17961
function! RemoveTrailingWhitespace()
    if &ft != "diff"
        let b:curcol = col(".")
        let b:curline = line(".")
        silent! %s/\s\+$//
        silent! %s/\(\s*\n\)\+\%$//
        call cursor(b:curline, b:curcol)
    endif
endfunction
autocmd BufWrite *.py :call RemoveTrailingWhitespace()
nmap <leader>rmw :call RemoveTrailingWhitespace()<cr>

" ���������Զ����������ڵ�Ŀ¼
augroup AutoMkdir
    autocmd!
    autocmd  BufNewFile  *  :call EnsureDirExists()
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Open vimgrep and put the cursor in the right position
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>rs :call VisualSelection('replace')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   :cw
"
" To go to the next search result do:
"   :cn
"
" To go to the previous search results do:
"   :cp
"
"map <leader>cp :botright cope<cr>

" ����<leader>cn,�����nerdcomment��������ͻ 
map <leader>cx :cn<cr>

map <leader>cp :cp<cr>

" ��quickfix���ڵ���Ϣ����ճ�����±�ǩ��
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>sl :setlocal spell!<cr>

" Shortcuts using <leader>
" �Ƶ���һ��ƴд����ĵ���
map <leader>sn ]s
map <leader>sp [s
" ����ƴд������õ�����ƴд��ȷ��
map <leader>si zg
" ����ƴд������õ�����ƴд�����
map <leader>sw zw
" ��ʾһ���й�ƴд���󵥴ʵ��б��ɴ���ѡ��
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>rmm mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scripbble
"map <leader>q :e ~/buffer<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => :TOhtml related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"��ʹ��css
let g:html_use_css = 0
"����֧��
let g:html_use_encoding = "gb2312"
"ǿ��ȥ���к�
let g:html_number_lines = 0
"ǿ�Ʊ��кţ�����Ҫת�����������±�ţ�
"let g:html_number_lines = 1
"����Ĭ��number ѡ������
"unlet g:html_number_lines
"���Դ����۵�
let g:html_ignore_folding = 1
"��ʹ��xhtml
let g:use_xhtml = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction 

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction


function! EnsureDirExists ()
    let required_dir = expand("%:h")
    if !isdirectory(required_dir)
	call AskQuit("Directory '" . required_dir . "' doesn't exist.", "&Create it?")

	try
	    call mkdir( required_dir, 'p' )
	catch
	    call AskQuit("Can't create '" . required_dir . "'", "&Continue anyway?")
	endtry
    endif
endfunction

function! AskQuit (msg, proposed_action)
    if confirm(a:msg, "&Quit?\n" . a:proposed_action) == 1
	exit
    endif
endfunction

