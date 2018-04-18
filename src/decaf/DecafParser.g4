parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}

program: 'class Program' '{' decl_campo* decl_metodo* '}'
decl_campo: { tipo id | tipo id  '{' int_literal '{'}+, ';'
decl_metodo: { tipo | void } id'{'|{ tipo id}+, | '}' block
block: '{'decl_variavel*statment* '}'
decl_variavel: tipo id +, ';'
tipo: int | boolean
statment: location asssign_op expr ';'
| call_metodo ';'
| if (expr) block | else block
| for id = expr ',' expr block
| return | expr | ';'
| break
| continue ';'
| block
assign_op: =
| +=
| -=
call_metodo: nome_metodo '('| expr+ , ')'
nome_metodo: id
location: id
| id '|' expr '|'
expr: location
|call_metodo
|literal
|expr bin_op expr
|'-' expr
| '!' expr
|'('expr')'
callout_arg:expr | string_literal
bin_op: arith_op| rel_op| eq_op | cond_op
arith_op: + | - | * | / | %
rel_op: < | > | <= | >=
eq_op: == | !=
cond_op: && | ||
litral: int_literal | char_literal | bool_literal


