%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylex();
void yyerror(const char *s);

typedef struct {
    char *str;
} YYSTYPE;

#define YYSTYPE_IS_DECLARED 1
%}

%union {
    char *str;
}

%token INT FLOAT CHAR
%token <str> ID
%token SEMICOLON COMMA

%%

program:
    declarations
    ;

declarations:
    declaration SEMICOLON declarations
    | declaration SEMICOLON
    ;

declaration:
    type id_list
    ;

type:
    INT
    | FLOAT
    | CHAR
    ;

id_list:
    ID
    | id_list COMMA ID
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(void) {
    yyparse();
    return 0;
}

