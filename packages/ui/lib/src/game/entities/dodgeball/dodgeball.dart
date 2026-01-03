import 'dart:async';

import 'package:domain/domain.dart' hide Enemy;
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:flutter/material.dart';
import 'package:ui/src/game/dodgeball_game.dart';
import 'package:ui/src/game/entities/player/player.dart';

part 'parts/splitter_ball.dart';

class Dodgeball extends SpriteComponent
    with HasGameReference<DodgeballGame>, EntityMixin, CollisionCallbacks {
  Dodgeball(this.ball)
    : direction = Vector2(1, 0),
      super(
        position: Vector2(ball.anchor.x, ball.anchor.y),
        size: Vector2.all(ball.radius * 2),
        priority: 3,
      );

  Dodgeball._(this.ball, {required this.direction})
    : super(
        position: Vector2(ball.anchor.x, ball.anchor.y),
        size: Vector2.all(ball.radius * 2),
        priority: 3,
      );

  final Ball ball;

  final Vector2 direction;

  @override
  FutureOr<void> onLoad() async {
    final image = await game.images.load(ball.image);

    sprite = Sprite(image);
    direction.x = switch (ball.isEnemy) {
      true => -1,
      false => 1,
    };

    add(CircleHitbox(radius: ball.radius, isSolid: true));

    return super.onLoad();
  }

  @override
  void update(double dt) {
    if (!isMounted) {
      return;
    }

    final cameraBounds = game.camera.visibleWorldRect;

    if (!cameraBounds.contains(Offset(position.x, position.y))) {
      removeFromParent();
      return;
    }

    final displacement = direction.normalized() * ball.speed * dt;

    position.add(displacement);
  }

  @override
  void removeFromParent() {
    ball.dispose();
    super.removeFromParent();
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Player) {
      other.actor.getHitBy(ball);
    }

    super.onCollision(intersectionPoints, other);
  }

  Future<void> addTo(World world) async {
    switch (ball) {
      case SplitterBall():
        await world.add(SplitterDodgeball(this));
      case BossBall():
      case EnemyBall():
      case FriendlyBall():
      case GiantBall():
      case RegularBall():
      case SpeedBall():
        await world.add(this);
    }
  }
}
