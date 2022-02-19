import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:state_managment/providers/task_providers.dart';

import '../models/task.dart';

class DataInputPage extends StatelessWidget {
  DataInputPage({Key? key}) : super(key: key);

  final TextEditingController _titleController = TextEditingController();

  addTask(BuildContext context) {
    Task newTask = Task(title: _titleController.text, isCompleted: false);
    Provider.of<TaskProvider>(context, listen: false).addTask(newTask);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        titleSpacing: 20,
        title: const Text(
          "Add To-Do",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        elevation: 70,
      ),
      body: Column(
        children: [
          Container(height: 250, child: Lottie.asset("assets/anim.json")),
          const Text(
            "Adding a new Task?",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add Task Here"),
            ),
          ),
          const SizedBox(height: 50),
          CupertinoButton(
              child: const Text("Add Task"),
              color: Colors.teal,
              onPressed: () {
                addTask(context);
              }),
        ],
      ),
    );
  }
}
