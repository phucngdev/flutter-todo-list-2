import 'package:app_3/widgets/todocard.dart';
import 'package:flutter/material.dart';
import 'models/todo_item.dart';
import 'widgets/modal_bottom.dart';

void main() {
  runApp(MaterialApp(
    home: MyWidget(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final List<Todo> todos = [];

  TextEditingController controller = TextEditingController();

  void _handleAddTask(String name) {
    final newTask = Todo(id: DateTime.now().toString(), name: name);
    setState(() {
      todos.add(newTask);
    });
  }

  void _handleDeleteTask(String id) {
    setState(() {
      todos.removeWhere((todo) => todo.id == id);
    });
  }

  void _handleEditTask(String id, String name) {
    setState(() {
      todos.removeWhere((todo) => todo.id == id);
      todos.add(Todo(id: id, name: name));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("todo list 2", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: todos
              .map((todo) => todoCard(
                  todo: todo,
                  index: todos.indexOf(todo),
                  deleteTask: _handleDeleteTask))
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(0))),
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return modalBottom(
                  addTask: _handleAddTask, editTask: _handleEditTask);
            },
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
