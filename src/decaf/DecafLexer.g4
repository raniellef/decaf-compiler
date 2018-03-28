lexer grammar DecafLexer;

@header {
package decaf;
}

options
{
  language=Java;
}



LCURLY : '{';
RCURLY : '}';

ID  : [a-z|A-Z|_] ([a-z|A-Z|_] | [0-9])*;

WS_ : [ \t\r\n]+ -> skip ;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

INT : '0x' [0-9|a-f|A-F]+ | ('-') [0-9]+ | [0-9]+;

CHAR :'\'' [\u0020-\u0088] '\'';
STRING : '\"' [\u0020-\u0088]+ '\"';

fragment
ESC :  '\\' ('n'|'"');
