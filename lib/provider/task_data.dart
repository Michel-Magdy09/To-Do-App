import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new5/database/data.dart';
import 'package:new5/task/task_info.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = LocalDatabase.tasksDb;
  int numBusiness = 0;
  int numPersonal = 0;

  Color color = Colors.pink;

  void changeColor() {
    if (color == Colors.pink) {
      color = Colors.blue;
    } else {
      color = Colors.pink;
    }
    notifyListeners();
  }

  void addTask(String newTask, String taskType) {
    final task = Task(name: newTask, type: taskType);
    LocalDatabase.insertIntoDataBase(newTask,taskType);

    if (taskType == "Business") {
      numBusiness++;
    } else {
      numPersonal++;
    }
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleChecked();
    notifyListeners();
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    LocalDatabase.deleteDatabase(task.id);
    if (task.type == "Business") {
      numBusiness--;
    } else {
      numPersonal--;
    }
    notifyListeners();
  }
}
