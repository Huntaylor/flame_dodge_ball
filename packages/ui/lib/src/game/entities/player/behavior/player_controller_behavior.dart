import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:flutter/src/services/hardware_keyboard.dart';
import 'package:ui/ui.dart';

class PlayerControllerBehavior extends Behavior<Player>
    with HasGameReference<DodgeballGame>, KeyboardHandler, CollisionCallbacks {
  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    final isKeyRepeat = event is KeyRepeatEvent;

    final isKeyDown = event is KeyDownEvent;

    if (!isKeyRepeat) {
      if (!isKeyDown) {
        parent.direction
          ..x = 0
          ..y = 0;
      } else {
        if (event.logicalKey == LogicalKeyboardKey.keyW ||
            event.logicalKey == LogicalKeyboardKey.keyS) {
          if (event.logicalKey == LogicalKeyboardKey.keyW) {
            parent.direction.y = -1;
          } else if (event.logicalKey == LogicalKeyboardKey.keyS) {
            parent.direction.y = 1;
          }
        }
        if (event.logicalKey == LogicalKeyboardKey.keyA ||
            event.logicalKey == LogicalKeyboardKey.keyD) {
          if (event.logicalKey == LogicalKeyboardKey.keyA) {
            parent.direction.x = -1;
          } else if (event.logicalKey == LogicalKeyboardKey.keyD) {
            parent.direction.x = 1;
          }
        }
      }
    }
    return super.onKeyEvent(event, keysPressed);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    // print('PlayerControllerBehavior onCollision');
    super.onCollision(intersectionPoints, other);
  }
}
