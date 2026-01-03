import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:ui/src/game/dodgeball_game.dart';
import 'package:ui/src/game/entities/dodgeball/dodgeball.dart';
import 'package:ui/src/game/entities/player/behavior/player_state_behavior.dart';

abstract class CorePlayer
    extends SpriteAnimationGroupComponent<PlayerAnimationState>
    with HasGameReference<DodgeballGame>, EntityMixin, CollisionCallbacks {
  CorePlayer(this.actor, {super.position}) : super(priority: 2) {
    actor.setup(
      onBallThrown: (ball) async {
        stateBehavior.state = .throwing;
        await Dodgeball(ball).addTo(game.level);
        stateBehavior.state = .idle;
      },
    );
  }

  final Actor actor;

  double horizontalMovement = 0;
  double verticalMovement = 0;

  late PlayerAnimationState playerAnimationState;

  late final PlayerStateBehavior stateBehavior =
      findBehavior<PlayerStateBehavior>();

  @override
  FutureOr<void> onLoad() async {
    _trackPosition();

    add(RectangleHitbox(size: Vector2(actor.size.width, actor.size.height)));

    addBehaviors();

    return super.onLoad();
  }

  @override
  void update(double dt) {
    final displacement =
        Vector2(horizontalMovement, verticalMovement).normalized() *
        actor.speed *
        dt;

    position.add(displacement);

    _trackPosition();
    super.update(dt);
  }

  void _trackPosition() {
    actor.position = (x: position.x, y: position.y);
  }

  void addBehaviors();
}
