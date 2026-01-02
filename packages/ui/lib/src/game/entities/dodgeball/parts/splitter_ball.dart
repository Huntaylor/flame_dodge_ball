part of '../dodgeball.dart';

class SplitterDodgeball extends Dodgeball {
  SplitterDodgeball(Dodgeball ball) : super(ball.ball);

  /// The delay in microseconds before the next ball is split
  double _delay = .5; // 1 second

  @override
  void update(double dt) {
    _delay -= dt;
    if (_delay <= 0) {
      split();
    }

    super.update(dt);
  }

  bool _hasSplit = false;

  void split() {
    if (_hasSplit) {
      return;
    }

    _hasSplit = true;
    final ball = this.ball;
    if (ball is! SplitterBall) {
      return;
    }

    final balls = [
      Dodgeball._(
        ball.split((x: position.x, y: position.y)),
        direction: Vector2(1, 1),
      ),

      Dodgeball._(
        ball.split((x: position.x, y: position.y)),
        direction: Vector2(1, -1),
      ),
    ];

    for (final ball in balls) {
      game.world.add(ball);
    }
  }
}
