lexer grammar DecafLexer;

@header {
package decaf;
}

options
{
  language=Java;
}

CLASS_PROG : 'class Program';
BOOLEAN : 'boolean';
BREAK : 'break';
CALLOUT : 'callout';
CLASS : 'class';
CONTINUE : 'continue';
IF : 'if';
ELSE : 'else';
BOOLEANLITERAL : 'false'|'true';
FOR : 'for';
INT : 'int';
RETURN : 'return';
VOID: 'void';


ID  : [a-zA-Z_] ([a-zA-Z_] | [0-9])*;

WS_ : [ \t\r\n]+ -> skip ;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

INTEGER : HEX_PREFIX HEX_DIGIT+ | MINUS DIGIT+ | DIGIT+;
DIGIT : [0-9];
HEX_PREFIX: '0x' ;
HEX_DIGIT : (DIGIT | [a-fA-F]);

CHAR :'\'' ([\u0020-\u0021\u0023-\u0026\u0028-\u005b\u005d-\u0088] | ESC) '\'';
STRING : '\"' [\u0020-\u0088]+ '\"';

OP_BIN : ( OP_ARITH | OP_REL | OP_COND | OP_EQ );
OP_ASSIGN : ( EQUAL | '+=' | '-=' );
EQUAL : '=' ;
MINUS : '-';
OP_ARITH : ( '+' | MINUS | '*' | '/' | '%' );
OP_REL :  ( '<' | '>' | '<=' | '>=' );
OP_COND : ( '&&' | '||' );
OP_EQ : ( '==' | '!=' );

SEMICOL : ';' ; 
COL : ',' ;

LCOL : '[' ;
RCOL : ']' ;

LPAR : '(' ;
RPAR : ')' ;

LCURLY : '{' ;
RCURLY : '}' ;

EXCL : '!' ;

fragment
ESC :  '\\' ('n'|'"'|'r'|'t'|'\\'|' ');
