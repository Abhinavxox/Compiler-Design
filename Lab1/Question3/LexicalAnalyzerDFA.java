package Lab1.Question3;

import java.util.Scanner;

public class LexicalAnalyzerDFA {
    // DFA states
    private static final int START_STATE = 0;
    private static final int IDENTIFIER_STATE = 1;
    private static final int NUMBER_STATE = 2;
    private static final int ERROR_STATE = -1;

    // DFA transition table
    private static final int[][] TRANSITION_TABLE = {
        // START_STATE
        {IDENTIFIER_STATE, NUMBER_STATE, ERROR_STATE},
        // IDENTIFIER_STATE
        {IDENTIFIER_STATE, IDENTIFIER_STATE, ERROR_STATE},
        // NUMBER_STATE
        {ERROR_STATE, NUMBER_STATE, ERROR_STATE}
    };

    // Check if a character is a valid identifier character
    private static boolean isIdentifierChar(char ch) {
        return Character.isLetter(ch) || ch == '_';
    }

    // Check if a character is a valid digit
    private static boolean isDigit(char ch) {
        return Character.isDigit(ch);
    }

    // Run DFA to recognize lexemes
    private static String analyzeLexeme(String lexeme) {
        int currentState = START_STATE;
        for (char ch : lexeme.toCharArray()) {
            int inputType;
            if (isIdentifierChar(ch)) {
                inputType = 0; // Identifier character
            } else if (isDigit(ch)) {
                inputType = 1; // Digit
            } else {
                return "Not a valid lexeme";
            }
            currentState = TRANSITION_TABLE[currentState][inputType];
            if (currentState == ERROR_STATE) {
                return "Not a valid lexeme";
            }
        }
        if (currentState == IDENTIFIER_STATE) {
            return "<ID," + lexeme + ">";
        } else if (currentState == NUMBER_STATE) {
            return "<NUM," + lexeme + ">";
        } else {
            return "Not a valid lexeme";
        }
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        while (true) {
            System.out.print("Enter a lexeme: ");
            String lexeme = scanner.nextLine().trim();
            if (lexeme.isEmpty()) {
                break;
            }
            String token = analyzeLexeme(lexeme);
            System.out.println("Token: " + token);
        }
        scanner.close();
    }
}
