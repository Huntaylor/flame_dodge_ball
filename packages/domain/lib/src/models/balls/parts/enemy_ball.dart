part of '../ball.dart';

class EnemyBall extends Ball {
  EnemyBall({required super.owner});

  @override
  double get speed => 220;

  @override
  double get radius => 10;

  @override
  double get damage => 15;

  @override
  double get cooldown => 1;

  @override
  int get max => 3;

  @override
  String get image => BallImages.enemyBall;
}
