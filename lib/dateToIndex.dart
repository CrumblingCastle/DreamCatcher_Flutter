// ignore_for_file: file_names, unused_import

import 'package:flutter/material.dart';
import 'main.dart';
import 'dream.dart';

int dateToIndex(DateTime selDate) {
  int i, len = dreams.length;
  if (selDate.isBefore(dreams[0].date)) {
    return 0;
  }
  for (i = 1; i < len; i++) {
    if (selDate.isBefore(dreams[i].date)) {
      return i - 1;
    }
  }
  return len - 1;
}
