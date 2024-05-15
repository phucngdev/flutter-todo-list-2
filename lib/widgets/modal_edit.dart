import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ModalEdit extends StatelessWidget {
  ModalEdit({super.key, required this.todo});

  var todo;

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        child: Container(
          height: 200,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: Text('Submit'),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
