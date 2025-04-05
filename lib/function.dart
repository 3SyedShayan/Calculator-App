onSubmit(int num1, int num2, String operator) {
  switch (operator) {
    case '+':
      return num1 + num2;
    case '-':
      return num1 - num2;
    case '*':
      return num1 * num2;
    case '/':
      if (num2 != 0) {
        return num1 / num2;
      } else {
        throw Exception('Division by zero is not allowed');
      }
    default:
      throw Exception('Invalid operator');
  }
}