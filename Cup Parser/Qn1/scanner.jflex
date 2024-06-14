import java_cup.runtime.*;

%%

%unicode
%cup

nl = \n|\r|\r\n
identifier = [a-z][a-z]*
int = [i][n][t]

%%

{int} {System.out.println("INT: "+yytext()); return new Symbol(sym.INT);}
{identifier} {System.out.println("ID: "+yytext()); return new Symbol(sym.ID);}
"," {System.out.println("COMMA"); return new Symbol(sym.COMMA);}
"(" {System.out.println("OB"); return new Symbol(sym.OB);}
")" {System.out.println("CB"); return new Symbol(sym.CB);}
";" {System.out.println("SC"); return new Symbol(sym.SC);}
{nl}|" "|\t {;}

. {System.out.println("Error: "+yytext());}

