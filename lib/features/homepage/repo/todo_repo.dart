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
}

final todoRepo = Provider((ref) => TodoRepo());
