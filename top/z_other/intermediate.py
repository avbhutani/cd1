class Parser:
    def __init__(self, expression):
        self.expression = expression
        self.pos = 0

    def parse_expression(self):
        code = self.parse_term()
        while self.pos < len(self.expression):
            if self.expression[self.pos] == '+':
                self.pos += 1
                term_code = self.parse_term()
                code += f" + {term_code}"
            elif self.expression[self.pos] == '-':
                self.pos += 1
                term_code = self.parse_term()
                code += f" - {term_code}"
            else:
                raise SyntaxError("Invalid operator")
        return code

    def parse_term(self):
        factor_code = self.parse_factor()
        while self.pos < len(self.expression):
            if self.expression[self.pos] == '*':
                self.pos += 1
                factor_code2 = self.parse_factor()
                factor_code += f" * {factor_code2}"
            elif self.expression[self.pos] == '/':
                self.pos += 1
                factor_code2 = self.parse_factor()
                factor_code += f" / {factor_code2}"
            else:
                break
        return factor_code

    def parse_factor(self):
        if self.expression[self.pos].isdigit():
            num = ""
            while self.pos < len(self.expression) and self.expression[self.pos].isdigit():
                num += self.expression[self.pos]
                self.pos += 1
            return num
        elif self.expression[self.pos] == '(':
            self.pos += 1
            code = self.parse_expression()
            if self.expression[self.pos] != ')':
                raise SyntaxError("Expected closing parenthesis")
            self.pos += 1
            return code
        else:
            raise SyntaxError("Invalid factor")


def generate_intermediate_code(expression):
    parser = Parser(expression)
    return parser.parse_expression()


if __name__ == "__main__":
    expression = input("Enter an arithmetic expression: ")
    try:
        intermediate_code = generate_intermediate_code(expression)
        print("Intermediate code:", intermediate_code)
    except SyntaxError as e:
        print("Syntax error:", e)
