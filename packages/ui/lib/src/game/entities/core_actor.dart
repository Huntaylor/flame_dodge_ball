import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:ui/src/game/dodgeball_game.dart';

abstract class CoreActor
    extends SpriteAnimationGroupComponent<ActorAnimationState>
    with HasGameReference<DodgeballGame>, EntityMixin, CollisionCallbacks {
  CoreActor(this.actor, {super.position}) : super(priority: 2);

  final Actor actor;

  double horizontalMovement = 0;
  double verticalMovement = 0;

  late ActorAnimationState actorAnimationState;

  @override
  FutureOr<void> onLoad() async {
    add(RectangleHitbox(size: Vector2(actor.size.width, actor.size.height)));

    return super.onLoad();
  }

  @override
  void update(double dt) {
    final displacement =
        Vector2(horizontalMovement, verticalMovement).normalized() *
        actor.speed *
        dt;

    position.add(displacement);

    if (actor.isDead) {
      removeFromParent();
      return;
    }

    _trackPosition();
    super.update(dt);
  }

  void _trackPosition() {
    actor.position = (x: position.x, y: position.y);
  }
}
