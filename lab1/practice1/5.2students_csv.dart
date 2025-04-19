import 'dart:io';

void main() async {
  final fileName = 'students.csv';

  final file = File(fileName);
  final students = [
    ['Name', 'Age', 'Address'], 
    ['Alice', '20', '123 Main St'],
    ['Bob', '22', '456 Elm St'],
    ['Charlie', '19', '789 Oak St'],
  ];

  final csvContent = students.map((row) => row.join(',')).join('\n');
  await file.writeAsString(csvContent);
  print('Data written to "$fileName".');

  if (await file.exists()) {
    final content = await file.readAsString();
    print('\nContents of "$fileName":');
    print(content);
  } else {
    print('File "$fileName" does not exist.');
  }
}