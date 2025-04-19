import 'dart:io';

void main(){
  print("Enter the number of persns:");
  int? numberOfPersons = int.tryParse(stdin.readLineSync()!);
  print("Enter the total amount of bill:");
  double? totalBill = double.tryParse(stdin.readLineSync()!);
  double? amountPerPerson = totalBill! / numberOfPersons!;
  print("The Amount of person is: $amountPerPerson");
}