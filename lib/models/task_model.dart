// To parse this JSON data, do
//
//     final memberInfo = memberInfoFromJson(jsonString);

import 'dart:convert';

class Task {
  Task({
    this.note,
    this.taskId,
    this.title,
    this.date,
    this.startTime,
    this.endTime,
    this.repeat,
    this.color,
    this.remind,
    this.isCompleted,
  });

  final int? taskId;
  final String? title;
  final String? note;
  final String? date;
  final String? startTime;
  final String? endTime;
  final String? repeat;
  final int? color;
  final int? remind;
  final int? isCompleted;

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        taskId: json["taskId"],
        title: json["title"],
    date: json["date"],
        note: json["note"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        repeat: json["repeat"],
        color: json["color"],
        remind: json["remind"],
        isCompleted: json["isCompleted"],
      );

  Map<String, dynamic> toJson() => {
        "taskId": taskId,
        "title": title,
        "note": note,
        "startTime": startTime,
        "endTime": endTime,
        "repeat": repeat,
        "color": color,
        "remind": remind,
        "isCompleted": isCompleted,
      };
}
