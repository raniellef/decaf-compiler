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

ID  : '_'('a'..'z' | 'A'..'Z'|[0-9])+ | ('a'..'z' | 'A'..'Z'|[0-9])+;

WS_ : [ \t\r\n]+ -> skip ;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

CHAR :'\'' [\u0020-\u0088] '\'' ('\n' | '\\' | '\t' | '\"'|'\'');
STRING : '"' (ESC|~'"')* '"';

fragment
ESC :  '\\' ('n'|'"');
