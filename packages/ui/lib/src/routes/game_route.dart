import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zenrouter/zenrouter.dart';

part 'menu_route.dart';
part 'unknown_route.dart';

abstract class GameRoute extends RouteTarget with RouteUnique {}

class GameCoordinator extends Coordinator<GameRoute> {
  GameCoordinator._();
  static GameCoordinator? _instance;
  static GameCoordinator get instance => _instance ??= GameCoordinator._();

  @override
  FutureOr<GameRoute> parseRouteFromUri(Uri uri) {
    return switch (uri.pathSegments) {
      [] || ['/'] => MenuRoute(),
      _ => UnknownRoute(),
    };
  }
}
