import java.io.*;

public class Main{
    public static void main(String argv[]){
        try{
            Yylex l = new Yylex(new FileReader(argv[0]));
            parser p = new parser(l);
            Object result = p.parse();
        }catch (Exception error){
            error.e.printStackTrace();
        }
    }
}