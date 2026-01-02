import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:ui/src/game/dodgeball_game.dart';
import 'package:ui/src/game/entities/player/behavior/player_controller_behavior.dart';

class Player extends SpriteAnimationComponent
    with HasGameReference<DodgeballGame>, EntityMixin, CollisionCallbacks {
  Player(
    this.actor, {
    super.animation,
    super.position,
    super.priority,
    super.autoResize,
  });

  final Actor actor;

  final Vector2 direction = Vector2.zero();

  late final PlayerControllerBehavior controllerBehavior =
      findBehavior<PlayerControllerBehavior>();

  @override
  FutureOr<void> onLoad() async {
    debugMode = true;

    final image = await game.images.load(actor.image);
    final jsonData = await game.assets.readJson(actor.animation);

    _trackPosition();

    add(RectangleHitbox(size: Vector2(actor.size.width, actor.size.height)));

    animation = SpriteAnimation.fromAsepriteData(image, jsonData);
    _addBehaviors();

    return super.onLoad();
  }

  @override
  void update(double dt) {
    final displacement = direction.normalized() * actor.speed * dt;

    position.add(displacement);

    _trackPosition();
    super.update(dt);
  }

  void _trackPosition() {
    actor.position = (x: position.x, y: position.y);
  }

  void _addBehaviors() => addAll([PlayerControllerBehavior()]);
}
