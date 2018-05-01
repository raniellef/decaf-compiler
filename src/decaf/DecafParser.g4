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

program: CLASS_PROG LCURLY decl_campo* decl_metodo* RCURLY ;

decl_campo: ( tipo id | tipo id  LCOL int_literal RCOL) (COL tipo id |COL tipo id  LCOL int_literal RCOL)* SEMICOL ;

decl_metodo: ( tipo | VOID ) id ( LPAR tipo id ( COL tipo id)* RPAR ) block ;

block: LCURLY decl_variavel* statment* RCURLY ;

decl_variavel: tipo id ( COL id)* SEMICOL ;

tipo: INT | BOOLEAN ;

statment: location assign_op expr SEMICOL
| call_metodo SEMICOL
| IF (expr) block | (ELSE block)  
| FOR id = expr COL expr block  
| RETURN ( expr ) SEMICOL
| BREAK
| CONTINUE SEMICOL 
| block ;

assign_op: OP_ASSIGN ;

call_metodo: nome_metodo LPAR (expr (COL expr)*) RPAR ;

nome_metodo: id ;

location: id | id LCOL expr RCOL ;

expr: location 
|call_metodo 
|literal 
|expr bin_op expr 
|MINUS expr 
|EXCL expr 
|LPAR expr RPAR ;

callout_arg: expr | string_literal ;

bin_op: arith_op| rel_op| eq_op | cond_op ;

arith_op: OP_ARITH ;

rel_op: OP_REL ;

eq_op: OP_EQ ;

cond_op: OP_COND ;

literal: int_literal | char_literal | bool_literal ;

id: ID ;

alpha_num: alpha | digit ;

alpha : CHAR ; //colocar o token q esta no lexer

digit: DIGIT ; //colocar o token q esta no lexer

hex_digit: HEX_DIGIT ;

int_literal: decimal_literal |hex_literal ;

decimal_literal: digit digit* ;

hex_literal: HEX_PREFIX hex_digit hex_digit* ;

bool_literal: BOOLEANLITERAL ;

char_literal: CHAR ;

string_literal: STRING ;




