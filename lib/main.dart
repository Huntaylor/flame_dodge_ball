import 'package:application/application.dart' as application;
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ui/ui.dart';

void main() {
  final getIt = GetIt.asNewInstance();

  application.setup(getIt);

  runApp(MainApp(getIt: getIt));
}
