// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TaskController on TaskControllerBase, Store {
  final _$_tasksAtom = Atom(name: 'TaskControllerBase._tasks');

  @override
  ObservableMap<String, Task> get _tasks {
    _$_tasksAtom.reportRead();
    return super._tasks;
  }

  @override
  set _tasks(ObservableMap<String, Task> value) {
    _$_tasksAtom.reportWrite(value, super._tasks, () {
      super._tasks = value;
    });
  }

  final _$TaskControllerBaseActionController =
      ActionController(name: 'TaskControllerBase');

  @override
  void put(String id, String title, String description) {
    final _$actionInfo = _$TaskControllerBaseActionController.startAction(
        name: 'TaskControllerBase.put');
    try {
      return super.put(id, title, description);
    } finally {
      _$TaskControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
