%{
#include "y.tab.h"
%}

%%

"int"             { return INT; }
"float"           { return FLOAT; }
"char"            { return CHAR; }
[a-zA-Z][a-zA-Z0-9]*   { yylval.str = strdup(yytext); return ID; }
";"               { return SEMICOLON; }
","               { return COMMA; }
[ \t\r\n]+        { /* Ignore whitespace */ }
.                 { /* Ignore unrecognized characters */ }

%%

int yywrap(void) {
    return 1;
}

