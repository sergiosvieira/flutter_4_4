import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:task_manager/task.dart';
import 'package:task_manager/task_controller.dart';

import 'app_routes.dart';

class TaskList extends StatelessWidget {
  final TaskController controller;

  const TaskList({this.controller});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        return Scaffold(
            appBar: AppBar(
              title: Text("Lista de Tarefas"),
              actions: <Widget>[
                FlatButton(
                  textColor: Colors.white,
                  onPressed: () {
                    //taskController.put("1", "Novo", "Descrição");
                    Navigator.of(context).pushNamed(AppRoutes.TASK_FORM);
                  },
                  child: Icon(Icons.add),
                  shape:
                      CircleBorder(side: BorderSide(color: Colors.transparent)),
                ),
              ],
            ),
            body: ListView.builder(
              itemCount: controller.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                      child: Icon(Icons.arrow_forward_ios_rounded)),
                  title: Text('${controller.at(index).title}'),
                  subtitle: Text('${controller.at(index).description}'),
                  trailing: Container(
                    width: 100,
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.edit),
                          // color: Colors.yellow.shade800,
                          onPressed: () {
                            Navigator.of(context).pushNamed(AppRoutes.TASK_FORM,
                                arguments: controller.at(index));
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          // color: Colors.red.shade800,
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                        title:
                                            Text("Apagar Tarefa - Confirmação"),
                                        content: Text("Tem certeza?"),
                                        actions: <Widget>[
                                          FlatButton(
                                            child: Text("Não"),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                          FlatButton(
                                            child: Text("Sim"),
                                            onPressed: () {
                                              Task t = controller.at(index);
                                              controller.remove(t.id);
                                              Navigator.pop(context);
                                            },
                                          )
                                        ]));
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ));
      },
    );
  }
}
