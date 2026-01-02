part of '../ball_type.dart';

class GiantBall extends BallType {
  const GiantBall();

  @override
  double get speed => 60;

  @override
  double get radius => 40;

  @override
  double get damage => 30;

  @override
  String get image => BallImages.giantBall;
}
