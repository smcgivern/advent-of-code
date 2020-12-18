NB. recdesc - recursive descent parser
NB. 10/30/06 Oleg Kobchenko
NB. 04/05/07 Oleg Kobchenko literate

NB. The following grammar rules are used:
NB.
NB. factor ::= ('+'|'-')* ( num | '(' expr ')' )
NB. term   ::= factor ( ('*'|'%') factor )*
NB. expr   ::= term ( ('+'|'-') term )*
NB. line   ::= expr EOF

NB. =========================================================
NB. regex lexer utilitites
require 'regex'
coclass 'z'

lxdefine=: 1 : '''(?x)'' , m : 0'
lxresult=: ((1 i.~[:*@,(1 1,:_ 1)&(];.0)) , {.)"2
lxmatches=: lxresult@rxmatches
lxfrom=: >@(([:' ['&,,&']')&.>)@rxfrom
lxview=: lxmatches (":@[ ,. }."1@[ lxfrom ]) ]

NB. =========================================================
NB. common single class
coclass 'pcalc'

NB. tokens
'S_SPACE S_NUM S_ADD S_SUB S_MUL S_DIV S_LPAR S_RPAR S_ERR'=: i. 9
S_EOF=: _1

destroy=: codestroy

NB. =========================================================
NB. Regex Lexer, Token Pump and Accessors

NB. =========================================================
NB. lexer part

LEX1=: noun lxdefine
( \s+     )|# 0 space
( [0-9.]+ )|# 1 number
( \+      )|# 2 add
( -       )|# 3 sub
( \*      )|# 4 mul
( /       )|# 5 div
( \(      )|# 6 lpar
( \)      )|# 7 rpar
( .+      ) # 8 error
)

NB. =========================================================
NB. creation

create=: 3 : 0
  STR=: y
  TOK=: LEX1 lxmatches STR
  I=: _1
  if. (#TOK)>ie=. S_ERR i.~{."1 TOK do.
    'characters' unexpect ie
  end.
  next''
)

NB. =========================================================
NB. token pump and accessors

next=: 3 : 0
  I=: I+1
  if. I<#TOK do. SYM=: {.I{TOK else. SYM=: S_EOF end.
  1
)

str=: 3 : 0
  if. y>:#TOK do. 'EOF' return. end.
  's b n'=. y{TOK
  (b,:n)];.0 STR
)
pos=: 3 : 0
  if. y>:#TOK do. _1 return. end.
  1{y{TOK
)
val=: 3 : '0".str y'

unexpect=: 'symbol'&$: : (4 : 0)
  y=. {.y,I
  error=. 'Unexpected ',x,' "',(str y),'" at ',":pos y
  error assert 0
)

NB. =========================================================
NB. parser part

accept=: 3 : '0:`next@.(SYM&=) y'
expect=: unexpect`1:@.accept

NB. =========================================================
NB. grammar rules

NB. factor ::= ('+'|'-')* ( num | '(' expr ')' )
factor=: 3 : 0
  s=. 1
  while. 1 do.
    if.     accept S_SUB do. s=. s*_1
    elseif. accept S_ADD do. 
    elseif.              do. break. end.
  end.

  if.     accept S_NUM  do. r=. val I-1
  elseif. accept S_LPAR do. r=. expr ''
          expect S_RPAR
  elseif.               do. 'factor' unexpect '' end.

  s*r
)

NB. term ::= factor ( ('*'|'%') factor )*
term=: 3 : 0
  r=. factor ''
  while. 1 do.
    if.     accept S_MUL do. r=. r + factor''
    elseif. accept S_DIV do. r=. r % factor''
    elseif.              do. break. end.
  end.
  r
)

NB. expr ::= term ( ('+'|'-') term )*
expr=: 3 : 0
  r=. term ''
  while. 1 do.
    if.     accept S_ADD do. r=. r * term''
    elseif. accept S_SUB do. r=. r - term''
    elseif.              do. break. end.
  end.
  r
)

NB. line ::= expr EOF
line=: 3 : 0
  r=. expr ''
  expect S_EOF
  r
)

NB. =========================================================
NB. runner

run=: 3 : 0
  p=. ''
  try. 
    p=. y conew 'pcalc'
    r=. line__p'' 
  catch. 
    smoutput 13!:12 ''
    r=. i.0 0 
  end.
  if. #p do. destroy__p'' end.
  r
)


NB. =========================================================
NB. public interface
calc_z_=: run_pcalc_
