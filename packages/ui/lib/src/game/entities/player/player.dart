import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:ui/src/game/dodgeball_game.dart';
import 'package:ui/src/game/entities/dodgeball/dodgeball.dart';
import 'package:ui/src/game/entities/player/behavior/player_controller_behavior.dart';

class Player extends SpriteAnimationComponent
    with HasGameReference<DodgeballGame>, EntityMixin, CollisionCallbacks {
  Player(
    this.actor, {
    super.animation,
    super.position,
    super.priority,
    super.autoResize,
  }) {
    actor.setup(
      onBallThrown: (ball) async {
        await game.world.add(Dodgeball(ball));
      },
    );
  }

  final Actor actor;

  double moveSpeed = 200;

  double horizontalMovement = 0;
  double verticalMovement = 0;

  late final PlayerControllerBehavior controllerBehavior =
      findBehavior<PlayerControllerBehavior>();

  @override
  FutureOr<void> onLoad() async {
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
    final displacement =
        Vector2(horizontalMovement, verticalMovement).normalized() *
        moveSpeed *
        dt;

    position.add(displacement);

    _trackPosition();
    super.update(dt);
  }

  void _trackPosition() {
    actor.position = (x: position.x, y: position.y);
  }

  void _addBehaviors() => addAll([PlayerControllerBehavior()]);
}
