import 'dart:core';
import 'package:flutter/material.dart';

class Dream {
  String title;
  String description;
  bool lucid;
  DateTime date;
  List<String> characters;
  List<String> place;
  List<String> theme;
  Image dreamImage;

  // TO DO: assets (photos and drawings)

  Dream({
    required this.date,
    this.title = 'Untitled Dream',
    this.description = 'No description added',
    this.lucid = false,
    this.characters = const ['null'],
    this.place = const ['null'],
    this.theme = const ['null'],
    this.dreamImage = const Image(
      image: NetworkImage(
          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
    ),
    // TO DO: assets (photos and drawings)
  });
}
