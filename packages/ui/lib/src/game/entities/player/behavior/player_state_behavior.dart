import 'dart:async';

import 'package:assets/assets/resources.dart';
import 'package:domain/domain.dart';
import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:ui/src/game/entities/player/core_player.dart';
import 'package:ui/ui.dart';

class PlayerStateBehavior extends Behavior<CorePlayer>
    with HasGameReference<DodgeballGame> {
  PlayerStateBehavior();

  PlayerAnimationState? _playerState;

  late final Map<PlayerAnimationState, PositionComponent> _stateMap;

  late final SpriteAnimationComponent idleAnimation;
  late final SpriteAnimationComponent runningAnimation;
  late final SpriteAnimationComponent throwingAnimation;
  // late final SpriteAnimationComponent throwingAndRunningAnimation;
  late final SpriteAnimationComponent hitAnimation;

  PlayerAnimationState get state => _playerState ?? PlayerAnimationState.idle;

  set state(PlayerAnimationState state) {
    if (state != _playerState) {
      final current = _stateMap[_playerState];

      if (current != null) {
        current.removeFromParent();

        if (current is SpriteAnimationComponent) {
          current.animationTicker?.reset();
        }
      }

      final replacement = _stateMap[state];
      if (replacement != null) {
        parent.add(replacement);
      }
      _playerState = state;
    }
  }

  @override
  FutureOr<void> onLoad() async {
    await _loadAllAnimations();
    return super.onLoad();
  }

  Future<void> _loadAllAnimations() async {
    idleAnimation = await _spriteAnimation(
      animationPath: PlayerImages.player1Idle,
      jsonData: await game.assets.readJson(PlayerAnimations.player1Idle),
    );
    throwingAnimation = await _spriteAnimation(
      animationPath: PlayerImages.player1ThrowingCombined,
      jsonData: await game.assets.readJson(
        PlayerAnimations.player1ThrowingCombined,
      ),
    );
    // throwingAndRunningAnimation = await _spriteAnimation(
    //   animationPath: PlayerImages.player1Running,
    //   jsonData: await game.assets.readJson(PlayerAnimations.player1Running),
    // );
    runningAnimation = await _spriteAnimation(
      animationPath: PlayerImages.player1Running,
      jsonData: await game.assets.readJson(PlayerAnimations.player1Running),
    );
    hitAnimation = await _spriteAnimation(
      animationPath: PlayerImages.player1Hit,
      jsonData: await game.assets.readJson(PlayerAnimations.player1Hit),
    );

    // List of all animations
    _stateMap = {
      PlayerAnimationState.idle: idleAnimation,
      PlayerAnimationState.running: runningAnimation,
      PlayerAnimationState.throwing: throwingAnimation,
      // PlayerAnimationState.throwingAndRunning: throwingAndRunningAnimation,
      PlayerAnimationState.hit: hitAnimation,
    };

    // Set current animationdw
    state = PlayerAnimationState.idle;
  }

  Future<SpriteAnimationComponent> _spriteAnimation({
    required String animationPath,
    required Map<String, dynamic> jsonData,
  }) async {
    final centerPosition = parent.size / 2 - Vector2(0, parent.size.y / 2);

    return SpriteAnimationComponent(
      animation: SpriteAnimation.fromAsepriteData(
        game.images.fromCache(animationPath),
        jsonData,
      ),
      anchor: Anchor.topCenter,
      position: centerPosition,
    );
  }
}
