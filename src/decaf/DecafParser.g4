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

decl_campo:  tipo ID (COL ID)* SEMICOL | tipo ID LCOL int_literal RCOL (COL ID LCOL int_literal RCOL)*  SEMICOL ;

decl_metodo: ( tipo | VOID ) ID LPAR  (tipo ID ( COL tipo ID)* )? RPAR block ;

block: LCURLY (decl_variavel | statment)* RCURLY ;

decl_variavel: tipo ID ( COL ID)* SEMICOL ;

tipo: INT | BOOLEAN ;

statment: location assign_op expr SEMICOL
| call_metodo SEMICOL
| IF LPAR expr RPAR block (ELSE block)?  
| FOR ID ATRIBUICAO expr COL expr block 
| RETURN ( expr ) SEMICOL
| BREAK SEMICOL
| CONTINUE SEMICOL 
| block ;

assign_op: ATRIBUICAO | INCREMENTO | DECREMENTO;

call_metodo: nome_metodo LPAR (expr (COL expr)*)? RPAR 
| CALLOUT LPAR (string_literal(COL callout_arg(COL callout_arg)*)?) RPAR;

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

arith_op: SOMA | MINUS | MULT | DIV | MOD ;

rel_op: MAIOR | MENOR | MAIORIGUAL | MENORIGUAL ;

eq_op: IGUALDADE | DIFERENTE ;

cond_op: AND | OR ;

literal: int_literal | char_literal | bool_literal ;

alpha_num: alpha | digit ;

alpha : CHAR ; //colocar o token q esta no lexer

digit: DIGIT ; //colocar o token q esta no lexer

int_literal: decimal_literal |hex_literal ;

decimal_literal: digit digit* ;

hex_literal: HEXA ;

bool_literal: BOOLEANLITERAL ;

char_literal: CHAR ;

string_literal: STRING ;




