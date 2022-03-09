// ignore_for_file: file_names, unused_import

import 'package:flutter/material.dart';
import 'main.dart';
import 'dream.dart';

int dateToIndex(DateTime selDate) {
  int i, len = dreams.length;
  DateTime dreamDate;

  if (selDate.isBefore(dreams[0].date)) {
    return 0;
  }
  for (i = 1; i < len; i++) {
    dreamDate = dreams[i].date;
    if (selDate.isAtSameMomentAs(dreamDate)) {
      return i;
    }
    if (selDate.isBefore(dreamDate)) {
      return i - 1;
    }
  }
  return len - 1;
}

int dateToInsertIndex(DateTime selDate) {
  int i, len = dreams.length;
  DateTime dreamDate;

  if (selDate.isBefore(dreams[0].date)) {
    return 0;
  }
  for (i = 1; i < len; i++) {
    dreamDate = dreams[i].date;
    if (selDate.isBefore(dreamDate)) {
      return i;
    }
  }
  return len;
}
