import 'dart:core';

class Dream {
  String title;
  String description;
  bool lucid;
  DateTime date;
  List<String> characters;
  List<String> place;
  List<String> theme;
  // TO DO: assets (photos and drawings)

  Dream({
    required this.date,
    this.title = 'Untitled Dream',
    this.description = 'No description added',
    this.lucid = false,
    this.characters = const ['null'],
    this.place = const ['null'],
    this.theme = const ['null'],
    // TO DO: assets (photos and drawings)
  });
}
