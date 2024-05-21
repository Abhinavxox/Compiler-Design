%{
#include "y.tab.h"
#include <stdio.h>
#include <stdlib.h>
%}

%%

[0-9]+              { yylval = atoi(yytext); return NUMBER; }
"+"                 { return PLUS; }
"-"                 { return MINUS; }
"*"                 { return MULTIPLY; }
"/"                 { return DIVIDE; }
"%"                 { return MODULUS; }
"("                 { return LPAREN; }
")"                 { return RPAREN; }
\n                  { return NEWLINE; }
[ \t]+              { /* Ignore whitespace */ }
.                   { return yytext[0]; }

%%

int yywrap() {
    return 1;
}

