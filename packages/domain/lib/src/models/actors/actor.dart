// ignore_for_file: unnecessary_getters_setters

import 'package:domain/src/models/balls/ball.dart';
import 'package:domain/src/models/id.dart';

abstract base class Actor {
  Actor({required double health}) : _health = health, id = Id();

  void setup({required Future<void> Function(Ball) onBallThrown}) {
    _hasSetup = true;
    _onBallThrown = onBallThrown;
  }

  final Id id;
  bool _hasSetup = false;

  late final Future<void> Function(Ball) _onBallThrown;

  double get speed;
  ({double height, double width}) get size;
  String get image;
  String get animation;

  double _health;
  double get health => _health;

  bool get isDead => _health <= 0;
  bool get isAlive => !isDead;

  ({double x, double y}) get position => _position;
  ({double x, double y}) _position = (x: 0, y: 0);
  set position(({double x, double y}) value) {
    _position = value;
  }

  final List<Id> _hitByIds = [];

  void getHitBy(Ball ball) {
    if (ball.ownerId == id || _hitByIds.contains(ball.id)) {
      return;
    }
    _hitByIds.add(ball.id);
    _health -= ball.damage;
  }

  final List<Ball> _balls = [];

  void removeBall(Ball ball) {
    _balls.remove(ball);
  }

  bool canThrow(Ball ball) {
    return switch (ball.max) {
      < 0 => true,
      final max => _balls.length < max,
    };
  }

  bool throwBall(Ball ball) {
    if (!_hasSetup) {
      throw Exception('Actor is not setup, cannot throw ball');
    }

    if (!canThrow(ball)) {
      return false;
    }

    _balls.add(ball);
    _onBallThrown(ball);
    return true;
  }
}
