part of '../ball.dart';

class NormalBall extends Ball {
  const NormalBall();

  @override
  double get speed => 100;

  @override
  double get radius => 10;

  @override
  double get damage => 10;

  @override
  String get image => BallImages.regularBall;
}
