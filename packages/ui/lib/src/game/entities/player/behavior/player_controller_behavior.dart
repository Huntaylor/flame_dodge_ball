import 'package:domain/domain.dart';
import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:flutter/src/services/hardware_keyboard.dart';
import 'package:ui/ui.dart';

class PlayerControllerBehavior extends Behavior<Player>
    with HasGameReference<DodgeballGame>, KeyboardHandler {
  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (_throw(event) case true) {
      return true;
    }

    if (_move(event) case true) {
      return true;
    }

    return super.onKeyEvent(event, keysPressed);
  }

  bool _throw(KeyEvent event) {
    if (event case KeyDownEvent(logicalKey: LogicalKeyboardKey.space)) {
      final ball = RegularBall(owner: parent.actor);

      final dodgeball = Dodgeball(ball);
      game.add(dodgeball);

      return true;
    }

    return false;
  }

  bool _move(KeyEvent event) {
    if (event is KeyRepeatEvent) {
      return false;
    }

    final isKeyDown = event is KeyDownEvent;

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

    return true;
  }
}
