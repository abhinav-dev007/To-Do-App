// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/data/database.dart';
import 'package:to_do_app/utils/dialog_box.dart';
import 'package:to_do_app/utils/todo_tile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  ToDoDataBase db = ToDoDataBase();
  final _controller = TextEditingController();

  final _myBox = Hive.box('mybox');

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
  db.updateDataBase();
  }

  void createNewTask() {
    showDialog(context: context, builder: (context) {
      return DialogBox(
        controller: _controller,
        onSave: saveNewTask,
        onCancel: Navigator.of(context).pop,
      );},);}

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
  db.updateDataBase();
  }

  void pinTask(int index) {
    setState(() {
      db.toDoList.first(index);
    });
  }

  @override
  void initState() {
    if(_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Center(child: Text("TO DO")),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteTask: (context) => deleteTask(index),
            pinTask: (context) => pinTask(index),
          );
    }),

    );
  }
}

