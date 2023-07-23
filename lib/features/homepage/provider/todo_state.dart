import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/features/homepage/model/todo_model.dart';

class TodoProvider extends ChangeNotifier {
  List<TodoModel> todoModel = [];

  addTodo(TodoModel model) {
    todoModel.add(model);
    notifyListeners();
  }

  completeTodo(String id) {
    final index = todoModel.indexWhere((element) => element.id == id);
    todoModel[index] = TodoModel(
        isCompleted: true,
        id: id,
        description: todoModel[index].description,
        title: todoModel[index].title);
    notifyListeners();
  }
}

final todoProvider = ChangeNotifierProvider((ref) => TodoProvider());
