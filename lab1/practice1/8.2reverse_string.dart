import 'dart:async';
import 'dart:io';

Future<String> reverseString(String input) async {

  return Future.delayed(Duration(seconds: 1), () {
    return input.split('').reversed.join('');
  });
}

void main() async {
  print('Enter a string:');
  String? input = stdin.readLineSync();

  if (input != null && input.isNotEmpty) {
    String reversed = await reverseString(input);
    print('Reversed string: $reversed');
  } else {
    print('No input provided.');
  }
}