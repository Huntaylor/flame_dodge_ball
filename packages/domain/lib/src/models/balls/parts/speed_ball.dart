part of '../ball.dart';

class SpeedBall extends Ball {
  const SpeedBall();

  @override
  double get speed => 200;

  @override
  double get radius => 8;

  @override
  double get damage => 5;

  @override
  String get image => BallImages.speedBall;
}
