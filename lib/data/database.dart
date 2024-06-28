import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {

  List toDoList = [];
  final _myBox =  Hive.box('mybox');
  //run this method for the first time ever opening the app
  void createInitialData() {
   toDoList = [
     ["Make Coffee",false],
     ["Important!!!",true],
   ];
  }

  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}