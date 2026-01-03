import 'package:ui/src/game/entities/player/behavior/player_state_behavior.dart';
import 'package:ui/src/game/entities/player/core_player.dart';

class EnemyPlayer extends CorePlayer {
  EnemyPlayer(super.actor, {super.position});

  @override
  void addBehaviors() {
    addAll([PlayerStateBehavior()]);
  }
}
