import 'dart:async';

import 'package:assets/assets/resources.dart';
import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:ui/src/game/dodgeball_game.dart';
import 'package:ui/src/game/entities/player/behavior/player_controller_behavior.dart';

class Player extends SpriteAnimationComponent
    with HasGameReference<DodgeballGame>, EntityMixin {
  Player({super.animation, super.position, super.priority, super.autoResize});

  final Vector2 direction = Vector2.zero();

  double moveSpeed = 200;

  late final PlayerControllerBehavior controllerBehavior =
      findBehavior<PlayerControllerBehavior>();

  @override
  FutureOr<void> onLoad() async {
    final image = await game.images.load(PlayerImages.player1Running);
    final jsonData = await game.assets.readJson(
      PlayerAnimations.player1Running,
    );

    animation = SpriteAnimation.fromAsepriteData(image, jsonData);
    _addBehaviors();

    return super.onLoad();
  }

  @override
  void update(double dt) {
    final displacement = direction.normalized() * moveSpeed * dt;

    position.add(displacement);
    super.update(dt);
  }

  void _addBehaviors() => addAll([PlayerControllerBehavior()]);
}
