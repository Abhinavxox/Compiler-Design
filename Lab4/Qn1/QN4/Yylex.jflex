import java.io.*;
import java.util.Scanner;

class Main{
public static void main(String args[]) throws IOException{
File file= new File("input.txt");
FileWriter fw=new FileWriter("output.txt");
FileReader sc=new FileReader(file);
Yylex lex=new Yylex(sc);
Token token = lex.yylex();

while(token.text != null) {
System.out.println("\t" + token.text);
token = lex.yylex();
}
}
}
class Token{
String text;
Token(String t){text = t;}
}
%%
letter = [a-zA-Z]
whitespace = [ \t\n]

%type Token
%eofval{
    return new Token(null);
%eofval}
%%
{letter}({letter})* { FileWriter fw=new FileWriter("output.txt",true);fw.write("ID\n");fw.close(); return new Token(yytext()); }
\r {/* Ingore new lines */ }