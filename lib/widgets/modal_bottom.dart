import 'package:flutter/material.dart';

class modalBottom extends StatelessWidget {
  modalBottom({
    super.key,
    required this.addTask,
    required this.editTask,
  });

  final Function(String) addTask;
  final Function(String, String) editTask;

  TextEditingController controller = TextEditingController();

  void _handleOnclick(BuildContext context) {
    if (controller.text.isEmpty) {
      return;
    }
    addTask(controller.text);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        child: Container(
          height: 200,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(children: [
              TextField(
                controller: controller,
                decoration: (InputDecoration(
                    labelText: "Add task",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)))),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () => _handleOnclick(context),
                  child: const Text("Add"))
            ]),
          ),
        ),
      ),
    );
  }
}
