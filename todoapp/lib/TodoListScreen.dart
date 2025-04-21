import 'package:flutter/material.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<String> tasks = [];
  List<bool> taskCompletion = []; // Tracks completion status of tasks

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo List')),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder:
            (context, index) => ListTile(
              title: Row(
                children: [
                  Checkbox(
                    value: taskCompletion[index],
                    onChanged: (bool? value) {
                      setState(() {
                        taskCompletion[index] = value!;
                      });
                    },
                  ),
                  SizedBox(width: 10),
                  Text(
                    tasks[index],
                    style: TextStyle(
                      decoration:
                          taskCompletion[index]
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addTask(),
        child: Icon(Icons.add),
      ),
    );
  }

  void _addTask() {
    TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('New Task'),
            content: TextField(controller: controller),
            actions: [
              MaterialButton(
                child: Text('Add'),
                onPressed: () {
                  setState(() {
                    tasks.add(controller.text);
                    taskCompletion.add(false); 
                    controller.clear();
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
    );
  }
}
