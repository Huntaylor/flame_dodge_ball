import 'dart:async';

import 'package:application/application.dart';
import 'package:domain/domain.dart';
import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:ui/src/game/entities/enemy/enemy_grunt.dart';
import 'package:ui/src/game/entities/player/player.dart';
import 'package:ui/src/game/level/level.dart';

class DodgeballGame extends FlameGame
    with HasKeyboardHandlerComponents, HasCollisionDetection {
  DodgeballGame({required this.gameBloc});

  final GameBloc gameBloc;
  final double gameWidth = 640;
  final double gameHeight = 320;

  late Player player1;
  late Level level;

  late Rectangle enemyArea;

  late SpawnComponent enemySpawnComponent;

  @override
  Color backgroundColor() {
    return Colors.orange;
  }

  @override
  FutureOr<void> onLoad() async {
    enemyArea = Rectangle.fromPoints(
      Vector2((gameWidth / 2) + 3, 0),
      Vector2(gameWidth - 32, gameHeight - 64),
    );

    enemySpawnComponent = SpawnComponent(
      factory: (i) => EnemyGrunt(Enemy()),
      /*   ..debugMode = true
        ..debugColor = Colors.black */
      period: 0.01,
      area: enemyArea,
      spawnCount: 25,
      spawnWhenLoaded: true,
    );

    await images.loadAllImages();
    _cameraSetup();
    player1 = Player(Me(), position: Vector2(gameWidth * .25, gameHeight / 2));

    await world.addAll([player1, enemySpawnComponent]);

    //Don't add anything after this, blocs are to be setup last
    await _setupBloc();
    return super.onLoad();
  }

  void _cameraSetup() {
    level = Level();
    final viewfinder = Viewfinder()..anchor = Anchor.topLeft;
    world = level;
    camera = CameraComponent.withFixedResolution(
      width: gameWidth,
      height: gameHeight,
      world: world,
      viewfinder: viewfinder,
      hudComponents: [FpsTextComponent(position: Vector2.all(10))],
    );
  }

  Future<void> _setupBloc() async {}
}
