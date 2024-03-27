import 'package:hive_flutter/adapters.dart';

@HiveType(typeId: 0)
class Task {
  @HiveField(0)
  final String date;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String task;
  @HiveField(3)
  final int isCompleted;
  @HiveField(4)
  final String endTime;
  @HiveField(5)
  final String startTime;

  Task(
      {required this.title,
      required this.task,
      required this.isCompleted,
      required this.date,
      required this.startTime,
      required this.endTime});
}
