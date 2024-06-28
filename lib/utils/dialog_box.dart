// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:to_do_app/utils/my_button.dart';
class DialogBox extends StatelessWidget {
  final controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  DialogBox({super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[400],
      content: Container(
        height: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(border: OutlineInputBorder(),
              hintText: "Add a new task",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text: "Save", onPressed: onSave),
                SizedBox(width: 8),
                MyButton(text: "Cancel", onPressed: onCancel),
              ],
            )
          ]),
      ),
    );
  }
}
