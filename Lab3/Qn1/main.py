class RecursiveDescentParser:
    def __init__(self, tokens):
        self.tokens = tokens
        self.position = 0

    def parse(self):
        if self.E() and self.position == len(self.tokens):
            print("Parsing succeeded.")
        else:
            print("Parsing failed.")

    def E(self):
        if self.T():
            return self.E_prime()
        return False

    def E_prime(self):
        if self.peek() == '+':
            self.consume('+')
            if self.T():
                return self.E_prime()
            return False
        return True  # ε

    def T(self):
        if self.F():
            return self.T_prime()
        return False

    def T_prime(self):
        if self.peek() == '*':
            self.consume('*')
            if self.F():
                return self.T_prime()
            return False
        return True  # ε

    def F(self):
        if self.peek() == 'id':
            self.consume('id')
            return True
        return False

    def peek(self):
        if self.position < len(self.tokens):
            return self.tokens[self.position]
        return None

    def consume(self, token):
        if self.peek() == token:
            self.position += 1
        else:
            raise SyntaxError(f"Expected {token} but found {self.peek()}")

# Correct
tokens = ['id', '+', 'id', '*', 'id']
parser = RecursiveDescentParser(tokens)
parser.parse()

# Wrong
tokens = ['id', '+', 'id', '*', 'id', '+']
parser = RecursiveDescentParser(tokens)
parser.parse()
