// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function (bool?)? onChanged;
  final Function (BuildContext)? deleteTask;
  final Function (BuildContext)? pinTask;
  ToDoTile({super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteTask,
    required this.pinTask,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(onPressed: deleteTask,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(12),
        ),
          child: Row(
            children: [
              Checkbox(value: taskCompleted,
                  onChanged: onChanged,
                activeColor: Colors.black,
              ),
              Text(taskName,
                style: TextStyle(
                  decoration: taskCompleted ?
                  TextDecoration.lineThrough :
                  TextDecoration.none,
                ),
              ),
            ],),
        ),
      ),
    );
  }
}
