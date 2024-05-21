%{
#include<stdio.h>
int no_lines=0, no_words=0, no_chars=0, no_other_chars=0, total_char=0;
%}
%%
\n { no_lines++; no_words++;}
[\t ' '] no_words++;
[a-zA-Z0-9] no_chars++;
. no_other_chars++;
%%
int main(int argc, char **argv)
{
    ++argv, --argc;
    if ( argc > 0 )
        yyin = fopen( argv[0], "r");
    else
        yyin = stdin;
    yylex();
    total_char=no_other_chars+no_chars;
    printf("......Result is......\n");
    printf("Number of lines:  %d\n", no_lines);
    printf("Number of words:  %d\n", no_words);
    printf("Number of alphanumeric characters:  %d\n", no_chars);
    printf("Number of other characters:  %d\n", no_other_chars);
    printf("Total number of characters:  %d\n", total_char);
}
int yywrap( )
{
    return 1;
}