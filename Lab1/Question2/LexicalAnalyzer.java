package  Lab1.Question2;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class LexicalAnalyzer {

    // Define token types
    private static final Map<String, String> tokenTypes = new HashMap<>();
    static {
        tokenTypes.put("if", "IF");
        tokenTypes.put("else", "ELSE");
        tokenTypes.put("(", "LPAREN");
        tokenTypes.put(")", "RPAREN");
        tokenTypes.put("<=", "LEQ");
        tokenTypes.put("=", "ASSIGN");
        tokenTypes.put("*", "MUL");
        tokenTypes.put("+", "ADD");
        tokenTypes.put(";", "SEMICOLON");
    }

    public static void main(String[] args) {
        String inputFile = "./Lab1/Question2/input.txt";
        String outputFile = "./Lab1/Question2/output.txt";

        try {
            // Read input file
            BufferedReader reader = new BufferedReader(new FileReader(inputFile));
            String line;
            StringBuilder inputBuilder = new StringBuilder();
            while ((line = reader.readLine()) != null) {
                inputBuilder.append(line).append("\n");
            }
            reader.close();

            // Tokenize input
            String input = inputBuilder.toString();
            String[] tokens = input.split("\\s+|(?=[()<=*+;])|(?<=[()<=*+;])");

            // Write lexemes and token classes to output file
            BufferedWriter writer = new BufferedWriter(new FileWriter(outputFile));
            for (String token : tokens) {
                if (!token.trim().isEmpty()) {
                    String tokenType = tokenTypes.getOrDefault(token, "ID");
                    writer.write("<" + tokenType + "," + token + ">");
                }
            }
            writer.close();

            System.out.println("Lexical analysis completed. Output saved to " + outputFile);

        } catch (IOException e) {
            System.err.println("Error: " + e.getMessage());
        }
    }
}
