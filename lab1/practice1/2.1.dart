import 'dart:io';

void main() {
  print("Simple Calculator");
  print("Enter first number:");
  double num1 = double.parse(stdin.readLineSync()!);

  print("Choose an operation:");
  print("1. Addition (+)");
  print("2. Subtraction (-)");
  print("3. Multiplication (*)");
  print("4. Division (/)");
  int choice = int.parse(stdin.readLineSync()!);

  print("Enter second number:");
  double num2 = double.parse(stdin.readLineSync()!);

  double result;

  switch (choice) {
    case 1:
      result = num1 + num2;
      print("Result: $result");
      break;
    case 2:
      result = num1 - num2;
      print("Result: $result");
      break;
    case 3:
      result = num1 * num2;
      print("Result: $result");
      break;
    case 4:
      if (num2 != 0) {
        result = num1 / num2;
        print("Result: $result");
      } else {
        print("Error: Division by zero is not allowed.");
      }
      break;
    default:
      print("Error: Invalid choice.");
  }
}