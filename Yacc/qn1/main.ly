{%
#include <stdio.h>
int flag = 0;
%}

%token OP
%left '+' '-'
%left '*' '/'
%left '(' ')'

%%
ArithmeticExpression E
;
E: E '+' E
| E '-' E
| E '*' E
| E '/' E
| '(' E ')'
| OP
;
%%

void main()
{
    printf("\nEnter an arithmetic expression.\n");
    yyparser();
    if(flag==0)
    print("\nValid arithmetic expression.\n");
}

void yyerror()
{
    print("\nInvalid arithmetic expression.\n");
    flag = 1;
}