" Summary:     Beautify statusline
" Description:
"         This script is used to beautify your statusline,and based on the
"         light2011 colorscheme. Thanks for xiaohuyee <xiaohuyee@gmail.com>
"         and Tian Huixiong <nedzqbear@gmail.com>
"         
" Screenshot:
"         http://vimer.1063083.n5.nabble.com/beautiful-vim-statusline-td4777850.html
"
" Maintainer: Tian Huixiong: <nedzqbear@gmail.com>
"             I'm very glad to receive your feedback.
" Licence:    This script is released under the Vim License.
" Version:    2.0
" Last Updated: 2012年07月06日 星期五 17时53分33秒
" Install:
"         Put this file in ~/.vim/plugin on *nix.
"         Or put it in $vim/vimfiles/plugin on Windows.
" Tutorial:
"         Just use it, and change it.
"         When you edit it, do not erase trailing-blanks.

set laststatus=2
"set statusline=
"set statusline+=%1*%-52F\
"set statusline+=%2*\ %{&ff=='unix'?'\\n':(&ff=='mac'?'\\r':'\\r\\n')}\
"set statusline+=%3*\ %{&fenc!=''?&fenc:&enc}\
"set statusline+=%1*\ %Y\
"set statusline+=%4*\ %04l/%03c\
"set statusline+=%2*\ 0x%04.4B\
"set statusline+=%1*\ %-16{strftime(\"%Y-%m-%d\ %H:%M\")}\
"set statusline+=%5*\ %-3m\
set statusline=
set statusline+=%1*\ %F%m%r%h\ %w%=
set statusline+=%3*\ [%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}][%{&ff}]%y\ 
set statusline+=%2*\ %l/%L=%p%%,%c\ 
set statusline+=%5*\ %b,0x%B\ 


"hi User1 guifg=#112605  guibg=#aefe7B gui=italic
"hi User2 guifg=#391100  guibg=#d3905c gui=none
"hi User3 guifg=#292b00  guibg=#f4f597 gui=none
"hi User4 guifg=#051d00  guibg=#7dcc7d gui=bold
"hi User5 guifg=#002600  guibg=#67ab6e gui=none
highlight User1 guifg=#112605 guibg=#aefe7b gui=italic ctermfg=234 ctermbg=156
highlight User2 guifg=#391100 guibg=#d3905c gui=NONE ctermfg=52 ctermbg=173 cterm=NONE
highlight User3 guifg=#292b00 guibg=#f4f597 gui=NONE ctermfg=235 ctermbg=229 cterm=NONE
highlight User4 guifg=#051d00 guibg=#7dcc7d gui=bold ctermfg=234 ctermbg=114 cterm=bold
highlight User5 guifg=#002600 guibg=#67ab6e gui=NONE ctermfg=22 ctermbg=71 cterm=NONE
