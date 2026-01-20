import 'dart:async';

import 'package:assets/assets/resources.dart';
import 'package:domain/domain.dart';
import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:ui/ui.dart';

class EnemyStateBehavior extends Behavior<EnemyGrunt>
    with HasGameReference<DodgeballGame> {
  EnemyStateBehavior();

  late final SpriteAnimation idleAnimation;
  late final SpriteAnimation runningAnimation;
  late final SpriteAnimation throwingAnimation;
  // late final SpriteAnimationComponent throwingAndRunningAnimation;
  late final SpriteAnimation hitAnimation;

  @override
  FutureOr<void> onLoad() async {
    await _loadAllAnimations();
    return super.onLoad();
  }

  Future<void> _loadAllAnimations() async {
    idleAnimation = await _spriteAnimation(
      animationPath: EnemySprites.enemyGruntIdle,
      jsonData: await game.assets.readJson(EnemyAnimations.enemyGruntIdle),
    );
    throwingAnimation =
        await _spriteAnimation(
            animationPath: EnemySprites.enemyGruntThrowing,
            jsonData: await game.assets.readJson(
              EnemyAnimations.enemyGruntThrowing,
            ),
          )
          ..loop = false;

    // throwingAndRunningAnimation = await _spriteAnimation(
    //   animationPath: EnemySprites.player1Running,
    //   jsonData: await game.assets.readJson(EnemyAnimations.player1Running),
    // );
    runningAnimation = await _spriteAnimation(
      animationPath: EnemySprites.enemyGruntRunning,
      jsonData: await game.assets.readJson(EnemyAnimations.enemyGruntRunning),
    );
    hitAnimation = await _spriteAnimation(
      animationPath: EnemySprites.enemyGruntHit,
      jsonData: await game.assets.readJson(EnemyAnimations.enemyGruntHit),
    );

    // List of all animations
    parent.animations = {
      ActorAnimationState.idle: idleAnimation,
      ActorAnimationState.running: runningAnimation,
      ActorAnimationState.throwing: throwingAnimation,
      ActorAnimationState.hit: hitAnimation,
    };

    // Set current animation
    parent.current = ActorAnimationState.idle;
  }

  Future<void> changeAnimation(ActorAnimationState state) async {
    if (state == .throwing) {
      parent.current = state;
      await parent.animationTicker!.completed;
      await parent.actor.throwBall(_nextBall());
    } else if (parent.current == .throwing && parent.animationTicker!.done()) {
      parent.current = state;
    } else if (parent.current != .throwing) {
      parent.current = state;
    }
  }

  Ball _nextBall() {
    // return SpeedBall(owner: parent.actor);
    // return RegularBall(owner: parent.actor);
    // return GiantBall(owner: parent.actor);
    // return FriendlyBall(owner: parent.actor);
    return EnemyBall(owner: parent.actor);
    // return BossBall(owner: parent.actor);
    // return SplitterBall(owner: parent.actor);
  }

  Future<SpriteAnimation> _spriteAnimation({
    required String animationPath,
    required Map<String, dynamic> jsonData,
  }) async {
    return SpriteAnimation.fromAsepriteData(
      game.images.fromCache(animationPath),
      jsonData,
    );
  }
}
