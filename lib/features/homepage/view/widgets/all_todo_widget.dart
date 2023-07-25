import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/features/homepage/provider/todo_state.dart';
import 'package:todoapp/features/homepage/view/widgets/todo_item_widget.dart';

class AllTodoWidget extends ConsumerWidget {
  const AllTodoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todo = ref.watch(todoProvider);
    return ListView.separated(
      padding: EdgeInsets.all(16),
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 8,
        );
      },
      itemCount: todo.todoModel.length,
      itemBuilder: (context, index) {
        return TodoItemWidget(
          title: todo.todoModel[index].title,
          description: todo.todoModel[index].description,
          taskCompleted: todo.todoModel[index].isCompleted,
          id: todo.todoModel[index].id,
        );
      },
    );
  }
}
