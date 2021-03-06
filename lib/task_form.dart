import 'package:flutter/material.dart';
import 'package:task_manager/task.dart';
import 'package:task_manager/task_controller.dart';

class TaskForm extends StatelessWidget {
  final TaskController controller;
  final Map<String, String> _formData = {};
  final _form = GlobalKey<FormState>();
  TaskForm({this.controller});
  void _loadData(Task task) {
    _formData["id"] = task.id;
    _formData["title"] = task.title;
    _formData["description"] = task.description;
  }

  @override
  Widget build(BuildContext context) {
    final task = ModalRoute.of(context).settings.arguments as Task;
    if (task != null) _loadData(task);
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulário de Tarefas"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              if (_form.currentState.validate()) {
                _form.currentState.save();

                String id = _formData["id"] != null
                    ? _formData["id"]
                    : (controller.length + 1).toString();
                controller.put(
                  id,
                  _formData['title'],
                  _formData['description'],
                );
                Navigator.of(context).pop();
              }
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData["title"],
                decoration: InputDecoration(labelText: "Título"),
                onSaved: (value) => _formData["title"] = value,
                validator: (value) {
                  if (value.length < 5) {
                    return "Título muito pequeno. (Mínimo 5 letras)";
                  }
                  return null;
                },
              ),
              TextFormField(
                initialValue: _formData["description"],
                decoration: InputDecoration(labelText: "Descrição"),
                onSaved: (value) => _formData["description"] = value,
                validator: (value) {
                  if (value.length < 5) {
                    return "Descrição muito pequena. (Mínimo 5 letras)";
                  }
                  return null;
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
