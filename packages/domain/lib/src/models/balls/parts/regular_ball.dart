part of '../ball_type.dart';

class RegularBall extends BallType {
  const RegularBall();

  @override
  double get speed => 100;

  @override
  double get radius => 10;

  @override
  double get damage => 10;

  @override
  String get image => BallImages.regularBall;
}
