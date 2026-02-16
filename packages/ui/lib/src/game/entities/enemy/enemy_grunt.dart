import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
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

  final rnd = Random();

  late Timer movementTimer;

  late final EnemyStateBehavior stateBehavior =
      findBehavior<EnemyStateBehavior>();
  late final EnemyControllerBehavior controllerBehavior =
      findBehavior<EnemyControllerBehavior>();

  bool triggerMovement = true;

  @override
  FutureOr<void> onLoad() {
    final time = rnd.nextIntBetween(1, 4);
    movementTimer = Timer(
      time.toDouble(),
      onTick: () {
        if (triggerMovement) {
          triggerMovement = false;
          controllerBehavior.moveEnemy();
        }
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
