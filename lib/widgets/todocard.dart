import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';

import 'modal_edit.dart';

class todoCard extends StatelessWidget {
  todoCard(
      {super.key,
      required this.todo,
      required this.index,
      required this.deleteTask});

  var index;
  var todo;

  final Function(String id) deleteTask;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(todo.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                )),
            Row(
              children: [
                InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(0))),
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          return ModalEdit(todo: todo);
                        },
                      );
                    },
                    child:
                        const Icon(Icons.add, size: 20, color: Colors.white)),
                SizedBox(width: 10),
                InkWell(
                    onTap: () async {
                      if (await confirm(context)) {
                        deleteTask(todo.id);
                      }
                      return;
                    },
                    child: const Icon(Icons.delete,
                        size: 20, color: Colors.white)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
