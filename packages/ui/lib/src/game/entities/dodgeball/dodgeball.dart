import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:ui/src/game/dodgeball_game.dart';
import 'package:ui/src/game/entities/player/player.dart';

class Dodgeball extends SpriteComponent
    with HasGameReference<DodgeballGame>, EntityMixin, CollisionCallbacks {
  Dodgeball(this.ball, {super.position});

  final Ball ball;

  @override
  FutureOr<void> onLoad() async {
    debugMode = true;
    final image = await game.images.load(ball.image);

    sprite = Sprite(image);

    add(CircleHitbox(radius: ball.radius, isSolid: true));

    return super.onLoad();
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Player) {
      other.actor.getHitBy(ball);
    }

    super.onCollision(intersectionPoints, other);
  }
}
