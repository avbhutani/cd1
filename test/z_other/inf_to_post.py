def prec(c):
	if c == '^':
		return 3
	elif c == '/' or c == '*':
		return 2
	elif c == '+' or c == '-':
		return 1
	else:
		return -1

def associativity(c):
	if c == '^':
		return 'R'
	return 'L' # Default to left-associative

def infix_to_postfix(s):
	result = []
	stack = []

	for i in range(len(s)):
		c = s[i]

		if ('a' <= c <= 'z') or ('A' <= c <= 'Z') or ('0' <= c <= '9'):
			result.append(c)

		elif c == '(':
			stack.append(c)

		elif c == ')':
			while stack and stack[-1] != '(':
				result.append(stack.pop())
			stack.pop() # Pop '('
		
        # If an operator is scanned
		else:
			while stack and (prec(c) < prec(stack[-1]) or (prec(c) == prec(stack[-1]) and associativity(c) == 'L')):
				result.append(stack.pop())
			stack.append(c)

	# Pop all the remaining elements from the stack
	while stack:
		result.append(stack.pop())

	print(''.join(result))

# Driver code
exp = "a+b*(c^d-e)^(f+g*h)-i"

# Function call
infix_to_postfix(exp)
