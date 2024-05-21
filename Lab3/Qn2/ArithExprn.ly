%{
#include<stdio.h>
int flag=0;
%}
%token OP
%left '+' '-'
%left'*' '/' '%'
%left '(' ')'
%%
ArithmeticExpression: E
;
E: E '+' E
| E '-' E
| E '*' E
| E '/' E
| E '%' E
| '(' E ')'
| OP
;
%%
void main()
{                  
    printf("\nEnter an arithmetic expression:\n");
    yyparse();
    if(flag==0)
    printf("\nEntered arithmetic expression is Valid\n\n");
    }
void yyerroг()
{
    printf("\nInvalid expression\n");
    flag=1;
}



