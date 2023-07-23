import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/features/homepage/view/widgets/todo_item_widget.dart';

import '../../provider/todo_state.dart';

class TodoWidget extends ConsumerWidget {
  const TodoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todo = ref
        .watch(todoProvider)
        .todoModel
        .where((element) => element.isCompleted == false)
        .toList();
    return ListView.separated(
      padding: EdgeInsets.all(16),
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 8,
        );
      },
      itemCount: todo.length,
      itemBuilder: (context, index) {
        return TodoItemWidget(
            title: todo[index].title,
            description: todo[index].description,
            taskCompleted: todo[index].isCompleted,
            onChanged: (_) {},
            deleteFunction: (_) {});
      },
    );
  }
}
