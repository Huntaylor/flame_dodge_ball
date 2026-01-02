part of '../ball.dart';

class GiantBall extends Ball {
  const GiantBall({required super.owner});

  @override
  double get speed => 60;

  @override
  double get radius => 20;

  @override
  double get damage => 30;

  @override
  double get cooldown => 1;

  @override
  int get max => 1;

  @override
  String get image => BallImages.giantBall;
}
