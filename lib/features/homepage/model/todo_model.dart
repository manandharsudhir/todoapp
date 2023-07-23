class TodoModel {
  String title;
  String description;
  bool isCompleted;
  String id;

  TodoModel(
      {required this.isCompleted,
      required this.id,
      required this.description,
      required this.title});
}
