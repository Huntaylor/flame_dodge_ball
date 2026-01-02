import 'package:application/application.dart' as application;
import 'package:data/data.dart' as data;
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ui/ui.dart' as ui;
import 'package:ui/ui.dart';

void main() {
  final getIt = GetIt.asNewInstance();

  data.setup(getIt);
  application.setup(getIt);
  ui.setup();

  runApp(MainApp(getIt: getIt));
}
