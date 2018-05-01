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

decl_campo: ( tipo ID | tipo ID  LCOL int_literal RCOL) (COL tipo ID |COL tipo ID  LCOL int_literal RCOL)* SEMICOL ;

decl_metodo: ( tipo | VOID ) ID ( LPAR tipo ID ( COL tipo ID)* RPAR ) block ;

block: LCURLY decl_variavel* statment* RCURLY ;

decl_variavel: tipo ID ( COL ID)* SEMICOL ;

tipo: INT | BOOLEAN ;

statment: location assign_op expr SEMICOL
| call_metodo SEMICOL
| IF (expr) block | (ELSE block)  
| FOR LPAR ID = expr COL expr block RPAR  
| RETURN ( expr ) SEMICOL
| BREAK
| CONTINUE SEMICOL 
| block ;

assign_op: OP_ASSIGN ;

call_metodo: nome_metodo LPAR (expr (COL expr)*) RPAR ;

nome_metodo: ID ;

location: ID | ID LCOL expr RCOL ;

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




