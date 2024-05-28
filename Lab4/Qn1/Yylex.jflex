import java.io.*;

class Main {
    public static void main(String args[]) throws IOException {
        Yylex lex = new Yylex(new InputStreamReader(System.in));
        Token token = lex.yylex();
        while(token.text != null){
            token = lex.yylex();
        }
    }
}

class Token {
    String text;
    Token(String t) { text = t; }
}

%%
%public
%class Yylex
%type void
digit = [ 0-9 ]
letter = [ a-zA-Z ]
whitespace = [ \t\n ]

%type Token
%eofval{
    return new Token(null);
%eofval}
%%
{letter}({letter}|{digit})* { System.out.print(yytext()+" is a valid Identifier\n");}
{whitespace}+ { }
\r {/* Ingore new lines */ }