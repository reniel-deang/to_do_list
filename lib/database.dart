import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';

class ToDoDataBase {
  List<List<dynamic>> toDoList = [];

  final _myBox = Hive.box('mybox');

  // Run this method if this is the 1st time ever opening this app
  void createInitialData() {
    toDoList = [
      ["Make Tutorial", false, DateTime.now(), TimeOfDay.now()],
    ];
    updateDataBase();
  }

  void loadData() {
    List<dynamic>? data = _myBox.get("TODOLIST");
    if (data != null) {
      toDoList = List<List<dynamic>>.from(data);
    }
  }

  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }

  void deleteTask(int index) {
    toDoList.removeAt(index);
    updateDataBase();
  }

  void addNewTask(String taskName, bool taskCompleted, DateTime? dueDate,
      TimeOfDay? dueTime) {
    toDoList.add([taskName, taskCompleted, dueDate, dueTime]);
    updateDataBase();
  }
}
