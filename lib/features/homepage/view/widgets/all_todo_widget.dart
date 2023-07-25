import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/core/base_model.dart';
import 'package:todoapp/features/homepage/provider/todo_state.dart';
import 'package:todoapp/features/homepage/view/widgets/todo_item_widget.dart';

class AllTodoWidget extends ConsumerWidget {
  const AllTodoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todo = ref.watch(todoProvider).todos;
    switch (todo.responseType) {
      case Status.loading:
        return Center(
          child: CircularProgressIndicator(),
        );
      case Status.error:
        return Center(
          child: Text(todo.message.toString()),
        );
      case Status.success:
        final data = todo.data ?? [];
        return ListView.separated(
          padding: EdgeInsets.all(16),
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 8,
            );
          },
          itemCount: data.length,
          itemBuilder: (context, index) {
            return TodoItemWidget(
              title: data[index].title,
              description: data[index].description,
              taskCompleted: data[index].isCompleted,
              id: data[index].id,
            );
          },
        );
    }
  }
}
