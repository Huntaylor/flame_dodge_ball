import 'dart:async';

import 'package:application/application.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ui/src/game/dodgeball_game.dart';
import 'package:ui/src/screens/menu/menu_screen.dart';
import 'package:ui/src/screens/settings/settings_screen.dart';
import 'package:zenrouter/zenrouter.dart';

part 'game_route.dart';
part 'menu_route.dart';
part 'settings_route.dart';
part 'unknown_route.dart';

abstract class Route extends RouteTarget with RouteUnique {}

class GameCoordinator extends Coordinator<Route> {
  GameCoordinator._(this._getIt);
  static void init(GetIt getIt) {
    if (_instance != null) {
      throw Exception('GameCoordinator already initialized');
    }

    _instance = GameCoordinator._(getIt);
  }

  static GameCoordinator? _instance;
  static GameCoordinator get instance =>
      _instance ?? (throw Exception('GameCoordinator not initialized'));

  final GetIt _getIt;

  @override
  FutureOr<Route> parseRouteFromUri(Uri uri) {
    return switch (uri.pathSegments) {
      [] || ['/'] => MenuRoute(),
      ['settings'] => SettingsRoute(),
      ['game'] => GameRoute(),
      _ => UnknownRoute(),
    };
  }
}
