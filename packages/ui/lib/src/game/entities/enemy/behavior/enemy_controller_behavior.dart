import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:ui/ui.dart';

class EnemyControllerBehavior extends Behavior<EnemyGrunt>
    with HasGameReference<DodgeballGame> {
  final rnd = Random();

  late Timer throwingTimer;
  late MoveEffect moveEffect;

  @override
  FutureOr<void> onLoad() async {
    throwingTimer = Timer(
      2,
      onTick: () async {
        await parent.stateBehavior.changeAnimation(.throwing);
      },
      repeat: true,
    );
    // await parent.stateBehavior.changeAnimation(.throwing);
    return super.onLoad();
  }

  Future<void> moveEnemy() async {
    // Value is >= 190 and < 550
    final randomPosition = Vector2(
      rnd.nextInt(190) + 360,
      rnd.nextInt(198) + 32,
    );

    final distance = parent.position.distanceTo(randomPosition);

    const maxDistance = 360.0;
    var travelTime = lerpDouble(0.5, 2.0, distance / maxDistance);

    travelTime = clampDouble(travelTime!, 0.5, 2);

    moveEffect = MoveEffect.to(
      randomPosition,
      EffectController(duration: travelTime),
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
