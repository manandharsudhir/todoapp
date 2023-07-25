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
  //Creating model without using factory constructor
  TodoModel.fromJson(Map<String, dynamic> json)
      : id = json["_id"],
        title = json["title"],
        description = json["description"],
        isCompleted = json["is_Completed"];

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "title": title,
      "description": description,
      "is_Completed": isCompleted,
    };
  }

  //Creating model using factory constructor
  // factory TodoModel.fromJson(Map<String, dynamic> json) {
  //   return TodoModel(
  //     id: json["_id"],
  //     title: json["title"],
  //     description: json["description"],
  //     isCompleted: json["is_completed"],
  //   );
  // }
}
