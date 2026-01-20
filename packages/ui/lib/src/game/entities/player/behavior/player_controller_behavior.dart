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

    if (_move(event, keysPressed) case true) {
      return true;
    }

    return super.onKeyEvent(event, keysPressed);
  }

  bool _throw(KeyEvent event) {
    if (event case KeyDownEvent(logicalKey: LogicalKeyboardKey.space)) {
      if (parent.horizontalMovement == 0 && parent.verticalMovement == 0) {
        parent.stateBehavior.changeAnimation(.throwing);
      } else {
        parent.stateBehavior.changeAnimation(.throwingAndRunning);
      }

      return true;
    }

    return false;
  }

  bool _move(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (event is KeyRepeatEvent) {
      return false;
    }

    parent.horizontalMovement = 0;
    parent.verticalMovement = 0;
    final isLeftKeyPressed =
        keysPressed.contains(LogicalKeyboardKey.keyA) ||
        keysPressed.contains(LogicalKeyboardKey.arrowLeft);
    final isRightKeyPressed =
        keysPressed.contains(LogicalKeyboardKey.keyD) ||
        keysPressed.contains(LogicalKeyboardKey.arrowRight);
    final isUpKeyPressed =
        keysPressed.contains(LogicalKeyboardKey.keyW) ||
        keysPressed.contains(LogicalKeyboardKey.arrowLeft);
    final isDownKeyPressed =
        keysPressed.contains(LogicalKeyboardKey.keyS) ||
        keysPressed.contains(LogicalKeyboardKey.arrowRight);

    parent.horizontalMovement += isLeftKeyPressed ? -1 : 0;
    parent.horizontalMovement += isRightKeyPressed ? 1 : 0;
    parent.verticalMovement += isUpKeyPressed ? -1 : 0;
    parent.verticalMovement += isDownKeyPressed ? 1 : 0;

    if (parent.horizontalMovement != 0 || parent.verticalMovement != 0) {
      parent.stateBehavior.changeAnimation(.running);
    } else {
      parent.stateBehavior.changeAnimation(.idle);
    }

    print(parent.position);

    return super.onKeyEvent(event, keysPressed);
  }
}
