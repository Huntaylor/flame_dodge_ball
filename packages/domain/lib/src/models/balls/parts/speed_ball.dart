part of '../ball.dart';

class SpeedBall extends Ball {
  const SpeedBall({required super.owner});

  @override
  double get speed => 380;

  @override
  double get radius => 8;

  @override
  double get damage => 5;

  @override
  double get cooldown => 1;

  @override
  int get max => 3;

  @override
  String get image => BallImages.speedBall;
}
