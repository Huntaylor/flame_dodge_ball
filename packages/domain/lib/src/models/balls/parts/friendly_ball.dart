part of '../ball_type.dart';

class FriendlyBall extends BallType {
  const FriendlyBall();

  @override
  double get speed => 100;

  @override
  double get radius => 10;

  @override
  double get damage => 0;

  @override
  String get image => BallImages.friendlyBall;
}
