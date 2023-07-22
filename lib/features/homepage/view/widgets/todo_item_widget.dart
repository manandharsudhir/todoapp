import 'package:flutter/material.dart';

class TodoItemWidget extends StatelessWidget {
  final String title;
  final String description;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  TodoItemWidget({
    super.key,
    required this.title,
    required this.description,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
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
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          CircleAvatar(
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.done),
            ),
            backgroundColor: Colors.green,
          ),
          SizedBox(
            width: 8,
          ),
          CircleAvatar(
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete),
            ),
            backgroundColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
