part of '../ball.dart';

class EnemyBall extends Ball {
  const EnemyBall({required super.owner});

  @override
  double get speed => 120;

  @override
  double get radius => 12;

  @override
  double get damage => 15;

  @override
  double get cooldown => 1;

  @override
  int get max => 3;

  @override
  String get image => BallImages.enemyBall;
}
