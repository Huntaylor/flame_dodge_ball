import 'dart:async';

import 'package:application/application.dart';
import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';

class DodgeballGame extends FlameGame {
  DodgeballGame({required this.gameBloc});

  final double gameWidth = 1920;
  final double gameHeight = 1027;

  final GameBloc gameBloc;

  @override
  FutureOr<void> onLoad() async {
    await images.loadAllImages();

    _cameraSetup();

    add(
      TextComponent(
        text: 'Hello World',
        position: Vector2(gameWidth / 2, gameHeight / 2),
      ),
    );

    await _setupLevel();

    //Don't add anything after this, blocs are to be setup last
    await _setupBloc();
    return super.onLoad();
  }

  void _cameraSetup() {
    final viewfinder = Viewfinder()
      ..anchor = Anchor.topLeft
      ..zoom = 10;

    camera = CameraComponent.withFixedResolution(
      width: gameWidth,
      height: gameHeight,
      world: world,
      viewfinder: viewfinder,
      hudComponents: [FpsTextComponent(position: Vector2.all(10))],
    );
  }

  Future<void> _setupLevel() async {}

  Future<void> _setupBloc() async {}
}
