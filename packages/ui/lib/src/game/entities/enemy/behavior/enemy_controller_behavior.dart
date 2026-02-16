import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/extensions.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:ui/ui.dart';

class EnemyControllerBehavior extends Behavior<EnemyGrunt>
    with HasGameReference<DodgeballGame> {
  final rnd = Random();

  late Timer throwingTimer;
  late MoveEffect moveEffect;

  @override
  FutureOr<void> onLoad() async {
    final time = rnd.nextIntBetween(1, 4);

    throwingTimer = Timer(
      time.toDouble(),
      onTick: () async {
        await parent.stateBehavior.changeAnimation(.throwing);
      },
      repeat: true,
    );
    return super.onLoad();
  }

  Future<void> moveEnemy() async {
    final randomPosition = game.enemyArea.randomPoint(random: rnd);

    final distance = parent.position.distanceTo(randomPosition);

    const maxDistance = 360.0;
    var travelTime = lerpDouble(0.5, 2.0, distance / maxDistance);

    travelTime = clampDouble(travelTime!, 0.5, 2);

    moveEffect = MoveToEffect(
      randomPosition,
      EffectController(duration: travelTime),
      onComplete: () {
        parent
          ..triggerMovement = true
          ..remove(moveEffect);
      },
    );

    parent.add(moveEffect);
    await parent.stateBehavior.changeAnimation(.running);
  }

  @override
  void update(double dt) {
    throwingTimer.update(dt);
    super.update(dt);
  }
}
