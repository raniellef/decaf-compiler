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


IDENTIFIER  : [a-zA-Z_] ([a-zA-Z_] | [0-9])*;

WS_ : [ \t\r\n]+ -> skip ;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

DIGIT : [0-9]+;
HEXA : '0x' ('0'..'9' | 'a'..'f' | 'A'..'F')*;

CHAR :'\'' ([\u0020-\u0021\u0023-\u0026\u0028-\u005b\u005d-\u0088] | ESC) '\'';
STRING : '\"' [\u0020-\u0088]+ '\"';

ATRIBUICAO : '=' ;
MINUS : '-';
SOMA : '+';
MULT : '*';
DIV : '/';
MOD : '%';

MAIOR : '>';
MENOR : '<';
MAIORIGUAL : '>=';
MENORIGUAL : '<=';

AND : '&&';
OR : '||';

INCREMENTO : '+=';
DECREMENTO : '-=';

IGUALDADE : '==';
DIFERENTE : '!=';

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
