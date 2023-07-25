import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/features/homepage/model/todo_model.dart';
import 'package:todoapp/features/homepage/repo/todo_repo.dart';

class TodoProvider extends ChangeNotifier {
  final Ref ref;
  TodoProvider({required this.ref});
  List<TodoModel> todoModel = [];

  getTodo() async {
    try {
      final response = await ref.read(todoRepo).getTodo();
      todoModel = response;
      notifyListeners();
    } catch (e) {
      todoModel = [];
    }
  }

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

  deleteTodo(String id) {
    todoModel.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}

final todoProvider = ChangeNotifierProvider((ref) => TodoProvider(ref: ref));
