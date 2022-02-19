import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managment/pages/todos_page.dart';
import 'package:state_managment/providers/task_providers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>TaskProvider(),
      
      builder:(context,child)=> MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Todo App",
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        //initialRoute: TodosPage.id,
        home:const  TodosPage(),
      ),
    );
  }
}
