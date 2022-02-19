import 'package:flutter/cupertino.dart';
import 'package:state_managment/models/task.dart';

class TaskProvider extends ChangeNotifier {   

  List<Task> tasks = [];

  addTask(Task newTask) {

    tasks.add(newTask);

    notifyListeners();
  }

 
}
