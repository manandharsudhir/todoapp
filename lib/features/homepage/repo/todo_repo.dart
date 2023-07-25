import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/core/base_client.dart';
import 'package:todoapp/features/homepage/model/todo_model.dart';

class TodoRepo {
  Future<List<TodoModel>> getTodo() async {
    try {
      final response = await BaseClient.instance.getData("v1/todos");
      final List<TodoModel> data = (response["items"] as List)
          .map((e) => TodoModel.fromJson(e))
          .toList();
      return data;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> addTodo({
    required String title,
    required String description,
    required bool isCompleted,
  }) async {
    try {
      await BaseClient.instance.postData("v1/todos", data: {
        "title": title,
        "description": description,
        "is_completed": isCompleted
      });
      return true;
    } catch (e) {
      return false;
    }
  }
}

final todoRepo = Provider((ref) => TodoRepo());
