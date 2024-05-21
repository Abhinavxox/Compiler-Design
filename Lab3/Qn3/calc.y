%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex();

%}

%token NUMBER
%token PLUS MINUS MULTIPLY DIVIDE MODULUS
%token LPAREN RPAREN NEWLINE

%left PLUS MINUS
%left MULTIPLY DIVIDE MODULUS
%right UMINUS

%%

program:
    program expression NEWLINE { printf("Result: %d\n", $2); }
    | /* empty */
    ;

expression:
    expression PLUS expression       { $$ = $1 + $3; }
    | expression MINUS expression    { $$ = $1 - $3; }
    | expression MULTIPLY expression { $$ = $1 * $3; }
    | expression DIVIDE expression   { $$ = $1 / $3; }
    | expression MODULUS expression  { $$ = $1 % $3; }
    | LPAREN expression RPAREN       { $$ = $2; }
    | MINUS expression %prec UMINUS  { $$ = -$2; }
    | NUMBER                         { $$ = $1; }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    printf("Enter expressions to evaluate (press Ctrl+D to exit):\n");
    yyparse();
    return 0;
}

