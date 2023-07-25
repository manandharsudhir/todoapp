import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/features/homepage/provider/todo_state.dart';

class TodoItemWidget extends ConsumerWidget {
  final String title;
  final String description;
  final bool taskCompleted;
  final String id;

  const TodoItemWidget({
    super.key,
    required this.title,
    required this.description,
    required this.taskCompleted,
    required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: !taskCompleted,
            child: CircleAvatar(
              backgroundColor: Colors.green,
              child: IconButton(
                onPressed: () {
                  ref.read(todoProvider).completeTodo(id);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                      "Todo Completed Successfully",
                    ),
                    backgroundColor: Colors.green,
                  ));
                },
                icon: const Icon(Icons.done),
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          CircleAvatar(
            backgroundColor: Colors.red,
            child: IconButton(
              onPressed: () {
                ref.read(todoProvider).deleteTodo(id);

                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                    "Todo Deleted Successfully",
                  ),
                  backgroundColor: Colors.red,
                ));
              },
              icon: const Icon(Icons.delete),
            ),
          ),
        ],
      ),
    );
  }
}
