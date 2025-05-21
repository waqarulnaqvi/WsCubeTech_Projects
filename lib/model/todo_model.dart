import 'package:todo_app_cubit/core/local/db_helper.dart';

class TodoModel {
  final int? id;
  final String title;
  final String description;
  final int priority;
  final bool isCompleted;

  TodoModel({
    this.id,
    required this.title,
    required this.description,
    required this.priority,
    required this.isCompleted,
  });

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map[DBHelper.columnId],
      title: map[DBHelper.columnTitle],
      description: map[DBHelper.columnDescription],
      priority: map[DBHelper.columnPriority],
      isCompleted: map[DBHelper.columnIsCompleted] == 1 ? true : false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      DBHelper.columnTitle: title,
      DBHelper.columnDescription: description,
      DBHelper.columnPriority: priority,
      DBHelper.columnIsCompleted: isCompleted ? 1 : 0,
    };
  }
}
