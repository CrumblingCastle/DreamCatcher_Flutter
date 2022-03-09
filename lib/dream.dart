import 'dart:core';

class Dream {
  String title;
  String description;
  bool lucid;
  DateTime date;
  List<String> characters;
  String place;
  String theme;

  Dream({
    required this.date,
    this.title = 'Untitled Dream',
    this.description = 'No description added',
    this.lucid = false,
    this.characters = const [],
    this.place = '',
    this.theme = '',
  });
}
