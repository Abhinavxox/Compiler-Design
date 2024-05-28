import java.io.*;

class Main {
    public static void main(String args[]) throws IOException {
        Yylex lex = new Yylex(new InputStreamReader(System.in));
        Token token = lex.yylex();
        while (token.text != null) {
            token = lex.yylex();
        }
    }
}

class Token {
    String text;
    Token(String t) { text = t; }
}

/* JFlex lexer definition */
%%
%public
%class Yylex
%type void
digit = [0-9]
letter = [a-zA-Z]
underscore = [_]
whitespace = [ \t\n]

%type Token
%eofval{
    return new Token(null);
%eofval}
%%

{digit}[^a-zA-Z]*{letter} { System.out.print(yytext() + " is a string starting with a number and ending with an alphabet\n"); }

{whitespace}+ { /* Ignore whitespace */ }
\r { /* Ignore new lines */ }
