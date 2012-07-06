" Vim syntax file
" Language:	MCS-51 Assembler (A51)
" Maintainer:	Killua

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

setlocal iskeyword=a-z,A-Z,48-57,.,_
setlocal isident=a-z,A-Z,48-57,.,_
syn case ignore

"Working Register
syn keyword a51WorkReg r0 r1 r2 r3 r4 r5 r6 r7

"Special Function Registers
syn keyword a51SFR p0 p0.0 p0.1 p0.2 p0.3 p0.4 p0.5 p0.6 p0.7
syn keyword a51SFR p1 p1.0 p1.1 p1.2 p1.3 p1.4 p1.5 p1.6 p1.7
syn keyword a51SFR p2 p2.0 p2.1 p2.2 p2.3 p2.4 p2.5 p2.6 p2.7
syn keyword a51SFR p3 p3.0 p3.1 p3.2 p3.3 p3.4 p3.5 p3.6 p3.7
syn keyword a51SFR SP dpl dph dptr pcon
syn keyword a51SFR tcon tf1 tr1 tf0 tr0 ie1 it1 ie0 it0
syn keyword a51SFR tmod tl0 tl1 th0 th1
syn keyword a51SFR scon sm0 sm1 sm2 ren tb8 rb8 ti ri
syn keyword a51SFR sbuf
syn keyword a51SFR ie ea et2 es et1 ex1 et0 ex0
syn keyword a51SFR ip pt2 ps pt1 px1 pt0 px0
syn keyword a51SFR psw cy ac f0 rs1 rs0 ov p
syn keyword a51SFR a acc.0 acc.1 acc.2 acc.3 acc.4 acc.5 acc.6 acc.7
syn keyword a51SFR b b.0 b.1 b.2 bc.3 b.4 b.5 b.6 bc.7

" Instruction
syn keyword a51Instr	mov movx movc push pop xch xchd swap 

syn keyword a51Instr 	add addc subb inc dec mul div da

syn keyword a51Instr	clr setb cpl rl rlc rr rrc anl orl xrl 

syn keyword a51Instr	lcall acall ret reti ajmp sjmp ljmp nop jb jnb

syn keyword a51Instr	jz jnz cjne djnz 

syn keyword a51Prefix	cseg at db ds end

"Symbol
syn match	a51Symbol		"[@#]"
syn match	a51Symbol		"[()|\[\]:]"

"Label
syn match	a51Label		"^\s*[^; \t]\+:"
syn match	a51Label		"[$]"

" Numbers
syn match	a51BinaryNumber	"\<[01]\+b\>"
syn match	a51HexNumber		"\<\d\x*h\>"
syn match	a51HexNumber		"\<\(0x\|$\)\x*\>"
syn match	a51OctalNumber	"\<\(0\o\+o\=\|\o\+o\)\>"
syn match	a51DecimalNumber	"\<\(0\|[1-9]\d*\)\>"

" Comment
syn region	a51Comment		start=";" end="$"
" String
syn region	a51String		start="\"" end="\"\|$"
syn region	a51String		start="'" end="'\|$"



"define link
hi def link	a51BinaryNumber		a51Number
hi def link	a51HexNumber		a51Number
hi def link	a51OctalNumber		a51Number
hi def link	a51DecimalNumber	a51Number

hi def link	a51WorkReg		a51Keyword
hi def link	a51SFR			a51Keyword

" Colors
hi a51Comment   guifg=#0033FF
hi a51Keyword   guifg=#339933
hi a51Number    guifg=#FF00FF
hi a51Symbol    guifg=#FF00FF
hi a51String    guifg=#FF00FF
hi a51Instr	guifg=#0000CC
hi a51Label	guifg=#FF0000
hi a51Prefix	guifg=#9933CC


let b:current_syntax = "a51"
" vim: ts=8 sw=8 :
