" ir_black color scheme
" More at: http://blog.infinitered.com/entries/show/8


" ********************************************************************************
" Standard colors used in all ir_black themes:
" Note, x:x:x are RGB values
"
"  normal: #f6f3e8
" 
"  string: #A8FF60  168:255:96                   
"    string inner (punc, code, etc): #00A0A0  0:160:160
"  number: #FF73FD  255:115:253                 
"  comments: #7C7C7C  124:124:124
"  keywords: #96CBFE  150:203:254             
"  operators: white
"  class: #FFFFB6  255:255:182
"  method declaration name: #FFD2A7  255:210:167
"  regular expression: #E9C062  233:192:98
"    regexp alternate: #FF8000  255:128:0
"    regexp alternate 2: #B18A3D  177:138:61
"  variable: #C6C5FE  198:197:254
"  
" Misc colors:
"  red color (used for whatever): #FF6C60   255:108:96 
"     light red: #FFB6B0   255:182:176
"
"  brown: #E18964  good for special
"
"  lightpurpleish: #FFCCFF
" 
" Interface colors:
"  background color: black
"  cursor (where underscore is used): #FFA560  255:165:96
"  cursor (where block is used): white
"  visual selection: #1D1E2C  
"  current line: #151515  21:21:21
"  search selection: #07281C  7:40:28
"  line number: #3D3D3D  61:61:61


" ********************************************************************************
" The following are the preferred 16 colors for your terminal
"           Colors      Bright Colors
" Black     #4E4E4E     #7C7C7C
" Red       #FF6C60     #FFB6B0
" Green     #A8FF60     #CEFFAB
" Yellow    #FFFFB6     #FFFFCB
" Blue      #96CBFE     #FFFFCB
" Magenta   #FF73FD     #FF9CFE
" Cyan      #C6C5FE     #DFDFFE
" White     #EEEEEE     #FFFFFF


" ********************************************************************************
set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "ir_black"


"hi Example         guifg=NONE        guibg=NONE        gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=NONE

" General colors
highlight Normal guifg=#f6f3e8 guibg=black gui=NONE ctermfg=255 ctermbg=16 cterm=NONE
highlight NonText guifg=#070707 guibg=black gui=NONE ctermfg=232 ctermbg=16 cterm=NONE

highlight Cursor guifg=black guibg=white gui=NONE ctermfg=16 ctermbg=231 cterm=NONE
highlight LineNr guifg=#3d3d3d guibg=black gui=NONE ctermfg=237 ctermbg=16 cterm=NONE

highlight VertSplit guifg=#202020 guibg=#202020 gui=NONE ctermfg=234 ctermbg=234 cterm=NONE
highlight StatusLine guifg=#cccccc guibg=#202020 gui=italic ctermfg=252 ctermbg=234 cterm=NONE
highlight StatusLineNC guifg=black guibg=#202020 gui=NONE ctermfg=16 ctermbg=234 cterm=NONE

highlight Folded guifg=#a0a8b0 guibg=#384048 gui=NONE ctermfg=248 ctermbg=238 cterm=NONE
highlight Title guifg=#f6f3e8 guibg=NONE gui=bold ctermfg=255 cterm=bold
highlight Visual guifg=NONE guibg=#262d51 gui=NONE ctermbg=17 cterm=NONE

highlight SpecialKey guifg=#808080 guibg=#343434 gui=NONE ctermfg=244 ctermbg=236 cterm=NONE

highlight WildMenu guifg=green guibg=yellow gui=NONE ctermfg=46 ctermbg=226 cterm=NONE
highlight PmenuSbar guifg=black guibg=white gui=NONE ctermfg=16 ctermbg=231 cterm=NONE
"hi Ignore           guifg=gray        guibg=black       gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=NONE

highlight Error guisp=#ff6c60 guifg=NONE guibg=NONE gui=undercurl cterm=undercurl
highlight ErrorMsg guifg=white guibg=#ff6c60 gui=bold ctermfg=231 ctermbg=203 cterm=bold
highlight WarningMsg guifg=white guibg=#ff6c60 gui=bold ctermfg=231 ctermbg=203 cterm=bold

" Message displayed in lower left, such as --INSERT--
highlight ModeMsg guifg=black guibg=#c6c5fe gui=bold ctermfg=16 ctermbg=189 cterm=bold

if version >= 700 " Vim 7.x specific colors
highlight CursorLine guifg=NONE guibg=#121212 gui=NONE ctermbg=233 cterm=NONE
highlight CursorColumn guifg=NONE guibg=#121212 gui=NONE ctermbg=233 cterm=NONE
highlight MatchParen guifg=#f6f3e8 guibg=#857b6f gui=bold ctermfg=255 ctermbg=244 cterm=bold
highlight Pmenu guifg=#f6f3e8 guibg=#444444 gui=NONE ctermfg=255 ctermbg=238 cterm=NONE
highlight PmenuSel guifg=#000000 guibg=#cae682 gui=NONE ctermfg=16 ctermbg=149 cterm=NONE
highlight Search guifg=NONE guibg=NONE gui=underline cterm=underline
endif

" Syntax highlighting
highlight Comment guifg=#7c7c7c guibg=NONE gui=NONE ctermfg=244 cterm=NONE
highlight String guifg=#a8ff60 guibg=NONE gui=NONE ctermfg=155 cterm=NONE
highlight Number guifg=#ff73fd guibg=NONE gui=NONE ctermfg=207 cterm=NONE

highlight Keyword guifg=#96cbfe guibg=NONE gui=NONE ctermfg=153 cterm=NONE
highlight PreProc guifg=#96cbfe guibg=NONE gui=NONE ctermfg=153 cterm=NONE
highlight Conditional guifg=#6699cc guibg=NONE gui=NONE ctermfg=67 cterm=NONE

highlight Todo guifg=#8f8f8f guibg=NONE gui=NONE ctermfg=246 cterm=NONE
highlight Constant guifg=#99cc99 guibg=NONE gui=NONE ctermfg=151 cterm=NONE

highlight Identifier guifg=#c6c5fe guibg=NONE gui=NONE ctermfg=189 cterm=NONE
highlight Function guifg=#ffd2a7 guibg=NONE gui=NONE ctermfg=223 cterm=NONE
highlight Type guifg=#ffffb6 guibg=NONE gui=NONE ctermfg=229 cterm=NONE
highlight Statement guifg=#6699cc guibg=NONE gui=NONE ctermfg=67 cterm=NONE

highlight Special guifg=#e18964 guibg=NONE gui=NONE ctermfg=173 cterm=NONE
highlight Delimiter guifg=#00a0a0 guibg=NONE gui=NONE ctermfg=37 cterm=NONE
highlight Operator guifg=white guibg=NONE gui=NONE ctermfg=231 cterm=NONE

hi link Character       Constant
hi link Boolean         Constant
hi link Float           Number
hi link Repeat          Statement
hi link Label           Statement
hi link Exception       Statement
hi link Include         PreProc
hi link Define          PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type
hi link Tag             Special
hi link SpecialChar     Special
hi link SpecialComment  Special
hi link Debug           Special


" Special for Ruby
hi rubyRegexp                  guifg=#B18A3D      guibg=NONE      gui=NONE      ctermfg=brown          ctermbg=NONE      cterm=NONE
hi rubyRegexpDelimiter         guifg=#FF8000      guibg=NONE      gui=NONE      ctermfg=brown          ctermbg=NONE      cterm=NONE
hi rubyEscape                  guifg=white        guibg=NONE      gui=NONE      ctermfg=cyan           ctermbg=NONE      cterm=NONE
hi rubyInterpolationDelimiter  guifg=#00A0A0      guibg=NONE      gui=NONE      ctermfg=blue           ctermbg=NONE      cterm=NONE
hi rubyControl                 guifg=#6699CC      guibg=NONE      gui=NONE      ctermfg=blue           ctermbg=NONE      cterm=NONE  "and break, etc
"hi rubyGlobalVariable          guifg=#FFCCFF      guibg=NONE      gui=NONE      ctermfg=lightblue      ctermbg=NONE      cterm=NONE  "yield
hi rubyStringDelimiter         guifg=#336633      guibg=NONE      gui=NONE      ctermfg=lightgreen     ctermbg=NONE      cterm=NONE
"rubyInclude
"rubySharpBang
"rubyAccess
"rubyPredefinedVariable
"rubyBoolean
"rubyClassVariable
"rubyBeginEnd
"rubyRepeatModifier
"hi link rubyArrayDelimiter    Special  " [ , , ]
"rubyCurlyBlock  { , , }

hi link rubyClass             Keyword 
hi link rubyModule            Keyword 
hi link rubyKeyword           Keyword 
hi link rubyOperator          Operator
hi link rubyIdentifier        Identifier
hi link rubyInstanceVariable  Identifier
hi link rubyGlobalVariable    Identifier
hi link rubyClassVariable     Identifier
hi link rubyConstant          Type  


" Special for Java
" hi link javaClassDecl    Type
hi link javaScopeDecl         Identifier 
hi link javaCommentTitle      javaDocSeeTag 
hi link javaDocTags           javaDocSeeTag 
hi link javaDocParam          javaDocSeeTag 
hi link javaDocSeeTagParam    javaDocSeeTag 

hi javaDocSeeTag              guifg=#CCCCCC     guibg=NONE        gui=NONE      ctermfg=darkgray    ctermbg=NONE        cterm=NONE
hi javaDocSeeTag              guifg=#CCCCCC     guibg=NONE        gui=NONE      ctermfg=darkgray    ctermbg=NONE        cterm=NONE
"hi javaClassDecl              guifg=#CCFFCC     guibg=NONE        gui=NONE      ctermfg=white       ctermbg=NONE        cterm=NONE


" Special for XML
hi link xmlTag          Keyword 
hi link xmlTagName      Conditional 
hi link xmlEndTag       Identifier 


" Special for HTML
hi link htmlTag         Keyword 
hi link htmlTagName     Conditional 
hi link htmlEndTag      Identifier 


" Special for Javascript
hi link javaScriptNumber      Number 


" Special for Python
"hi  link pythonEscape         Keyword      


" Special for CSharp
hi  link csXmlTag             Keyword      


" Special for PHP
