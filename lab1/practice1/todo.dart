import 'dart:io';

class ToDoApp {
  List<String> _tasks = [];

  void addTask(String task) {
    _tasks.add(task);
    print('Task added: $task');
  }

  void removeTask(String task) {
    if (_tasks.remove(task)) {
      print('Task removed: $task');
    } else {
      print('Task not found: $task');
    }
  }

  void viewTasks() {
    if (_tasks.isEmpty) {
      print('No tasks available.');
    } else {
      print('Your tasks:');
      for (var i = 0; i < _tasks.length; i++) {
        print('${i + 1}. ${_tasks[i]}');
      }
    }
  }
}

void main() {
  final toDoApp = ToDoApp();
  while (true) {
    print('\nTo-Do App');
    print('1. Add Task');
    print('2. Remove Task');
    print('3. View Tasks');
    print('4. Exit');
    stdout.write('Choose an option: ');
    final input = stdin.readLineSync();

    switch (input) {
      case '1':
        stdout.write('Enter a task to add: ');
        final task = stdin.readLineSync();
        if (task != null && task.isNotEmpty) {
          toDoApp.addTask(task);
        } else {
          print('Task cannot be empty.');
        }
        break;
      case '2':
        stdout.write('Enter a task to remove: ');
        final task = stdin.readLineSync();
        if (task != null && task.isNotEmpty) {
          toDoApp.removeTask(task);
        } else {
          print('Task cannot be empty.');
        }
        break;
      case '3':
        toDoApp.viewTasks();
        break;
      case '4':
        print('Exiting the app. Goodbye!');
        return;
      default:
        print('Invalid option. Please try again.');
    }
  }
}
