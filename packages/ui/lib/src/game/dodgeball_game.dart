import 'dart:async';

import 'package:application/application.dart';
import 'package:domain/domain.dart';
import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:ui/src/game/entities/dodgeball/dodgeball.dart';
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

  @override
  Color backgroundColor() {
    return Colors.orange;
  }

  @override
  FutureOr<void> onLoad() async {

    await images.loadAllImages();
    _cameraSetup();
    player1 = Player(Me(), priority: 2, position: Vector2(gameWidth / 2, gameHeight / 2));
    await world.add(player1);

    final ball = Dodgeball(
      RegularBall(owner: player1.actor),
      // position: Vector2(gameWidth / 2 - 10, gameHeight / 2 - 30),
    );
    await add(ball);

    await _setupLevel();

    //Don't add anything after this, blocs are to be setup last
    await _setupBloc();
    return super.onLoad();
  }

  void _cameraSetup() {
    level = Level();
    final viewfinder = Viewfinder()
      ..anchor = Anchor.topLeft;
world = level;
    camera = CameraComponent.withFixedResolution(
      width: gameWidth,
      height: gameHeight,
      world: level,
      viewfinder: viewfinder,
      hudComponents: [FpsTextComponent(position: Vector2.all(10))],
    );
  }

  Future<void> _setupLevel() async {}

  Future<void> _setupBloc() async {}
}

