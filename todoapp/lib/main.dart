import 'package:flutter/material.dart';
import 'TodoListScreen.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Simple Todo App', home: TodoListScreen());
  }
}
