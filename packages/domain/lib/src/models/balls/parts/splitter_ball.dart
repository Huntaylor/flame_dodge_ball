part of '../ball_type.dart';

class SplitterBall extends BallType {
  const SplitterBall();

  @override
  double get speed => 90;

  @override
  double get radius => 15;

  @override
  double get damage => 8;

  @override
  String get image => BallImages.splitterBall;
}
