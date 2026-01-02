part of '../ball_type.dart';

class BossBall extends BallType {
  const BossBall();

  @override
  double get speed => 80;

  @override
  double get radius => 25;

  @override
  double get damage => 50;

  @override
  String get image => BallImages.bossBall;
}
