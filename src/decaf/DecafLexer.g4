lexer grammar DecafLexer;

@header {
package decaf;
}

options
{
  language=Java;
}

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

LCURLY : '{';
RCURLY : '}';

ID  : [a-zA-Z_] ([a-zA-Z_] | [0-9])*;

WS_ : [ \t\r\n]+ -> skip ;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

INTEGER : '0x' [0-9|a-f|A-F]+ | ('-') [0-9]+ | [0-9]+;

CHAR :'\'' ([\u0020-\u0021\u0023-\u0026\u0028-\u005b\u005d-\u0088] | ESC) '\'';
STRING : '\"' [\u0020-\u0088]+ '\"';

OP : ('+' | '-' | '*' | '<' | '>'|'='| '||' |'<='  |'!=' | '&&');
POT : (','| ';');
LCOL : '[';
RCOL : ']';
LPAR : '(';
RPAR : ')';

fragment
ESC :  '\\' ('n'|'"'|'r'|'t'|'\\');
