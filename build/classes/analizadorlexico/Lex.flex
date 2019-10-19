package analizadorlexico;

import static analizadorlexico.Token.*;

%%

%type Token
%class Analizador_Lex

%line
%column
%char

LETRAS = [a-zA-Z_]
DIGITO = [0-9]
WHITE=[ \t\r\n]
%{
public String lexeme;
%}

%%
{WHITE} {/*Ignore*/}
"+" {return SUMA;}
"-" {return RESTA;}
"/" {return DIV;}
"\\" {return DVENT;}
"*" {return MULT;}
"=" {return ASSIGN;}
"(" {return INI_PARENTESIS;}
")" {return FIN_PARENTESIS;}
"{" {return INI_LLAVES;}
"}" {return FIN_LLAVES;}
"<" {return MENOR;}
">" {return MAYOR;}
"!=" {return DIFERENTE;}
"==" {return IGUALDA;}
"<=" {return MENOR_IGUAL;}
">=" {return MAYOR_IGUAL;}
";" {return TERM;}
"WHILE" {return WHILE;} 
"DO" {return DO;}

 
{LETRAS}({LETRAS}|{DIGITO})* {lexeme=yytext(); return ID;}
("(-"{DIGITO }+")")|{ DIGITO }+ {lexeme=yytext(); return INT;}
. {lexeme=yytext();return ERROR;}



