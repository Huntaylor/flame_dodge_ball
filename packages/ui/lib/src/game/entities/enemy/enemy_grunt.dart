import 'dart:async';

import 'package:flame/components.dart';
import 'package:ui/src/game/entities/core_actor.dart';
import 'package:ui/src/game/entities/enemy/behavior/enemy_controller_behavior.dart';
import 'package:ui/src/game/entities/enemy/behavior/enemy_state_behavior.dart';
import 'package:ui/ui.dart';

class EnemyGrunt extends CoreActor {
  EnemyGrunt(super.actor, {super.position}) {
    actor.setup(
      onBallThrown: (ball) async {
        await Dodgeball(ball).addTo(game.level);
        await stateBehavior.changeAnimation(.idle);
      },
    );
  }

  late Timer movementTimer;

  late final EnemyStateBehavior stateBehavior =
      findBehavior<EnemyStateBehavior>();
  late final EnemyControllerBehavior controllerBehavior =
      findBehavior<EnemyControllerBehavior>();

  @override
  FutureOr<void> onLoad() {
    movementTimer = Timer(
      3,
      onTick: () {
        controllerBehavior.moveEnemy();
      },
      repeat: true,
    );
    addAll([EnemyStateBehavior(), EnemyControllerBehavior()]);

    return super.onLoad();
  }

  @override
  void update(double dt) {
    movementTimer.update(dt);
    super.update(dt);
  }
}
