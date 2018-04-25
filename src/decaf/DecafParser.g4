parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}

// + significa 1 ou varias ,só pode ser usado em lista
// * significa  0 ou varias

program: 'class Program' '{' decl_campo* decl_metodo* '}' ;

decl_campo: ( tipo id | tipo id  '[' int_literal ']') (',' tipo id |',' tipo id  '[' int_literal ']')* ';' ;

decl_metodo: ( tipo | 'void' ) id ( '(' tipo id (','tipo id)* ')' ) block ;

block: '{'decl_variavel*statment* '}' ;

decl_variavel: tipo id (',' id)* ';' ;

tipo: 'int' | 'boolean' ;

statment: location asssign_op expr ';'
| call_metodo ';' 
| 'if' (expr) block | ('else' block)  
| 'for' id = expr ',' expr block  
| 'return' ( expr ) ';'
| 'break'
| continue ';' 
| 'block' ;

assign_op: '='  | '+=' | '-=' ;

call_metodo: nome_metodo '(' (expr (',' expr)*) ')' ;

nome_metodo: id ;

location: id | id '[' expr ']';

expr: location 
|call_metodo 
|literal 
|expr bin_op expr 
|'-' expr 
| '!' expr 
|'('expr')' ;

callout_arg: expr | string_literal ;

bin_op: arith_op| rel_op| eq_op | cond_op ;

arith_op: '+' | '-' | '*' | '/' | '%' ;

rel_op: '<' | '>' | '<=' | '>=' ;

eq_op: '==' | '!=' ;

cond_op: '&&' | '||' ;

litral: int_literal | char_literal | bool_literal ;

id: alpha alpha_num* ;

alpha_num: alpha | digit ;

alpha : [a-zA-Z] ; //colocar o token q esta no lexer

digit: [0-9] ; //colocar o token q esta no lexer

hex_digit: digit [a-f |A-F] ;

int_literal: decimal_literal |hex_literal ;

decimal_literal: digit digit* ;

hex_literal: '0x' hex_digit hex_digit* ;

bool_literal: 'true'|'false' ;

char_literal: '\''char* '\'' ;

string_literal: '\"' char* '\"' ;




