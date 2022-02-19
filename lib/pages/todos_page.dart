// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:state_managment/models/task.dart';
import 'package:state_managment/pages/data_input_page.dart';
import 'package:state_managment/providers/task_providers.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({
    Key? key,
  }) : super(key: key);
  static const String id = "/todo-page";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        titleSpacing: 20,
        title: const Text(
          "Todos App",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        elevation: 70,
      ),
      body: Consumer<TaskProvider>(
        builder: (context, taskProvider, child) => Column(
          children: [
            Expanded(
                child:taskProvider.tasks.isEmpty? Center(
                  child: Lottie.asset("assets/no-todo.json")
                ):ListView.builder(
              itemBuilder: (context, index) => Dismissible(
                key: Key(taskProvider.tasks[index].title),
                onDismissed: (v) {
                  taskProvider.tasks.removeAt(index);
                },
                child: Card(
                    child: ListTile(
                  title: Text(taskProvider.tasks[index].title),
                  subtitle: Text(taskProvider.tasks[index].isCompleted
                      ? "Completed"
                      : "incomplete"),
                )),
              ),
              itemCount: taskProvider.tasks.length,
            )),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              width: 300,
              height: 60,
              child: CupertinoButton(
                child: Text(
                  "Add Todos",
                ),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DataInputPage())),
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
