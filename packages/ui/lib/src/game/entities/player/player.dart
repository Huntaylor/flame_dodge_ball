import 'dart:async';

import 'package:ui/src/game/entities/core_actor.dart';
import 'package:ui/src/game/entities/dodgeball/dodgeball.dart';
import 'package:ui/src/game/entities/player/behavior/player_controller_behavior.dart';
import 'package:ui/src/game/entities/player/behavior/player_state_behavior.dart';

class Player extends CoreActor {
  Player(super.actor, {super.position}) {
    actor.setup(
      onBallThrown: (ball) async {
        await Dodgeball(ball).addTo(game.level);

        if (horizontalMovement == 0 && verticalMovement == 0) {
          await stateBehavior.changeAnimation(.idle);
        } else {
          await stateBehavior.changeAnimation(.running);
        }
      },
    );
  }

  late final PlayerControllerBehavior controllerBehavior =
      findBehavior<PlayerControllerBehavior>();

  late final PlayerStateBehavior stateBehavior =
      findBehavior<PlayerStateBehavior>();

  @override
  FutureOr<void> onLoad() {
    addAll([PlayerControllerBehavior(), PlayerStateBehavior()]);

    return super.onLoad();
  }
}
