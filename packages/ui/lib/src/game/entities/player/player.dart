import 'package:ui/src/game/entities/player/behavior/player_controller_behavior.dart';
import 'package:ui/src/game/entities/player/behavior/player_state_behavior.dart';
import 'package:ui/src/game/entities/player/core_player.dart';

class Player extends CorePlayer {
  Player(super.actor, {super.position});

  late final PlayerControllerBehavior controllerBehavior =
      findBehavior<PlayerControllerBehavior>();

  @override
  void addBehaviors() {
    addAll([PlayerControllerBehavior(), PlayerStateBehavior()]);
  }
}
