import 'dart:io';

void printDirectoryStructure(Directory directory, [String indent = '']) {
  final List<FileSystemEntity> entities = directory.listSync();
  for (var entity in entities) {
    if (entity is Directory) {
      print('$indent└── ${entity.uri.pathSegments.last}/');
      printDirectoryStructure(entity, '$indent    ');  // Recurse into subdirectory
    } else if (entity is File) {
      print('$indent└── ${entity.uri.pathSegments.last}');
    }
  }
}

void main() {
  final currentDir = Directory.current;  // Get the current working directory
  printDirectoryStructure(currentDir);   // Print the directory structure
}
