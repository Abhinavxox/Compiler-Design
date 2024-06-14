import java_cup.runtime.*;

%%

%unicode
%cup

identifier = [a-zA-Z_][a-zA-z_0-9]*
nl = \n|\r|\r\n|\t
type = int|float|boolean|char|long|short|void|byte

%%

{identifier} {System.out.println("ID: "+yytext()); return new Symbol(sym.ID);}
"(" {System.out.println("OB"); return new Symbol(sym.OB);}
")" {System.out.println("CB"); return new Symbol(sym.OB);}
"+" {System.out.println("ADD"); return new Symbol(sym.ADD);}
"-" {System.out.println("MIN"); return new Symbol(sym.MIN);}
"/" {System.out.println("DIV"); return new Symbol(sym.DIV);}
"*" {System.out.println("MUL"); return new Symbol(sym.MUL);}
{nl}|" " {;}
. {System.out.println("ERROR : "+yytext());}
