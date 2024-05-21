%{
#include<stdio.h>
#include "y.tab.h"
%}

%%
[a-zA-Z0-9]+ { return OP; }
[\n] return;
. return yytext[0];

%%
int yywrap()
{
return 1;
}


