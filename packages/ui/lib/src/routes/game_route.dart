import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:zenrouter/zenrouter.dart';

part 'menu_route.dart';
part 'unknown_route.dart';

abstract class GameRoute extends RouteTarget with RouteUnique {}

class GameCoordinator extends Coordinator<GameRoute> {
  GameCoordinator._(this.getIt);
  static void init(GetIt getIt) {
    if (_instance != null) {
      throw Exception('GameCoordinator already initialized');
    }

    _instance = GameCoordinator._(getIt);
  }

  static GameCoordinator? _instance;
  static GameCoordinator get instance =>
      _instance ?? (throw Exception('GameCoordinator not initialized'));

  final GetIt getIt;

  @override
  FutureOr<GameRoute> parseRouteFromUri(Uri uri) {
    return switch (uri.pathSegments) {
      [] || ['/'] => MenuRoute(),
      _ => UnknownRoute(),
    };
  }
}
