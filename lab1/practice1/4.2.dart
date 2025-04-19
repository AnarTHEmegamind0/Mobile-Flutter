import 'dart:io';

class ToDoApp {
  List<String> _tasks = [];

  void addTask(String task) => _tasks.add(task);

  void removeTask(String task) {
    if (_tasks.contains(task)) {
      _tasks.remove(task);
      print("Task '$task' removed.");
    } else {
      print("Task '$task' not found.");
    }
  }

  void viewTasks() {
    if (_tasks.isEmpty) {
      print("No tasks available.");
    } else {
      print("Your tasks:");
      _tasks.forEach((task) => print("- $task"));
    }
  }
}

void main() {
  ToDoApp app = ToDoApp();
  while (true) {
    print("\nTo-Do App Menu:");
    print("1. Add Task");
    print("2. Remove Task");
    print("3. View Tasks");
    print("4. Exit");
    stdout.write("Enter your choice: ");
    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        stdout.write("Enter task to add: ");
        String task = stdin.readLineSync()!;
        app.addTask(task);
        print("Task '$task' added.");
        break;
      case 2:
        stdout.write("Enter task to remove: ");
        String task = stdin.readLineSync()!;
        app.removeTask(task);
        break;
      case 3:
        app.viewTasks();
        break;
      case 4:
        print("Exiting To-Do App. Goodbye!");
        return;
      default:
        print("Invalid choice. Please try again.");
    }
  }
}
