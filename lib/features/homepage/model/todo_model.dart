import 'dart:convert';

class TodoModel {
  String id;
  String title;
  String description;
  bool isCompleted;

  TodoModel({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json["_id"],
      title: json["title"],
      description: json["description"],
      isCompleted: json["is_completed"],
    );
  }
}
