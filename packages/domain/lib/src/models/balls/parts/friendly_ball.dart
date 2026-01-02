part of '../ball.dart';

class FriendlyBall extends Ball {
  const FriendlyBall({required super.owner});

  @override
  double get speed => 100;

  @override
  double get radius => 10;

  @override
  double get damage => 0;

  @override
  String get image => BallImages.friendlyBall;
}
