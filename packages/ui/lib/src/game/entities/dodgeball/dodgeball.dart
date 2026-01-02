import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:ui/src/game/dodgeball_game.dart';

class Dodgeball extends SpriteComponent
    with HasGameReference<DodgeballGame>, EntityMixin, CollisionCallbacks {
  Dodgeball({required this.type, super.position});

  final BallType type;

  @override
  FutureOr<void> onLoad() async {
    debugMode = true;
    final image = await game.images.load(type.image);

    sprite = Sprite(image);

    add(CircleHitbox(radius: type.radius, isSolid: true));

    return super.onLoad();
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    //
    super.onCollision(intersectionPoints, other);
  }
}
