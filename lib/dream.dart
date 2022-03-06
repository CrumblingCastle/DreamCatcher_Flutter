import 'dart:core';

class Dream {
  String title;
  String description;
  bool lucid;
  DateTime date;

  Dream(
      {this.title = 'Untitled Dream',
      this.description = 'No description added',
      this.lucid = false,
      required this.date});
}
