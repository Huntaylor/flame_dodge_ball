import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ui/src/routes/game_route.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.getIt});

  final GetIt getIt;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: GameCoordinator.instance.routeInformationParser,
      routerDelegate: GameCoordinator.instance.routerDelegate,
    );
  }
}
