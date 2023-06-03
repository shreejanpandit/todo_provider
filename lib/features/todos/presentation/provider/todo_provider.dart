import 'package:flutter/foundation.dart';
import '../../data/models/todo_models.dart';

class TodoProvider with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  List<Todo> _todoList = [];

  List<Todo> get todoList => _todoList;

  void addTodo(Todo todo) {
    _todoList.add(todo);
    notifyListeners();
  }

  void removeTodoAt(int index) {
    if (index >= 0 && index < _todoList.length) {
      _todoList.removeAt(index);
      notifyListeners();
    }
  }

  void clearTodos() {
    _todoList.clear();
    notifyListeners();
  }

  void toggleTodoStatus(Todo todo) {
    todo.done = !todo.done;
    notifyListeners();
  }
}
