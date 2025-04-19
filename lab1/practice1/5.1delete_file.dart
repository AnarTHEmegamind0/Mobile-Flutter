import 'dart:io';

void main() async {
  final fileName = 'hello_copy.txt';

  final file = File(fileName);

  if (await file.exists()) {
    await file.delete();
    print('File "$fileName" deleted.');
  } else {
    print('File "$fileName" does not exist.');
  }
}


