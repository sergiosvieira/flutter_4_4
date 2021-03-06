import 'package:flutter/material.dart';
import 'package:task_manager/app_routes.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:task_manager/task_controller.dart';
import 'package:task_manager/task_form.dart';
import 'package:task_manager/task_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final TaskController taskController = TaskController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "task manager",
        theme: ThemeData(
            primarySwatch: Colors.blueGrey,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        routes: {
          AppRoutes.HOME: (_) => TaskList(controller: this.taskController),
          AppRoutes.TASK_FORM: (_) => TaskForm(controller: this.taskController),
        });
  }
}
