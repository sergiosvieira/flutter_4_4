import 'package:mobx/mobx.dart';
import 'package:task_manager/task.dart';

part 'task_controller.g.dart';

class TaskController = TaskControllerBase with _$TaskController;

abstract class TaskControllerBase with Store {
  @observable
  // ObservableList<Task> _tasks = ObservableList.of([]);
  ObservableMap<String, Task> _tasks = ObservableMap();
  @action
  void put(
    String id,
    String title,
    String description,
  ) {
    if (id != null && id.trim().isNotEmpty && _tasks.containsKey(id)) {
      _tasks.update(
        id,
        (_) => Task(
          id: id,
          title: title,
          description: description,
        ),
      );
      return;
    }
    _tasks.putIfAbsent(
        id,
        () => Task(
              id: id,
              title: title,
              description: description,
            ));
  }

  List<Task> get all {
    return [..._tasks.values];
  }

  int get length {
    return _tasks.length;
  }

  Task at(int index) {
    return _tasks.values.elementAt(index);
  }

  void remove(String id) {
    if (id != null) {
      _tasks.remove(id);
    }
  }
}
