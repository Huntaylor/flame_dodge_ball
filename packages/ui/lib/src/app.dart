import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ui/src/routes/route.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key, required this.getIt});

  final GetIt getIt;

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
    GameCoordinator.init(widget.getIt);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: GameCoordinator.instance.routeInformationParser,
      routerDelegate: GameCoordinator.instance.routerDelegate,
    );
  }
}
