part of '../ball_type.dart';

class EnemyBall extends BallType {
  const EnemyBall();

  @override
  double get speed => 120;

  @override
  double get radius => 12;

  @override
  double get damage => 15;

  @override
  String get image => BallImages.enemyBall;
}
