part of '../ball.dart';

class FriendlyBall extends Ball {
  FriendlyBall({required super.owner});

  @override
  double get speed => 300;

  @override
  double get radius => 10;

  @override
  double get damage => 0;

  @override
  double get cooldown => 1;

  @override
  int get max => -1;

  @override
  String get image => BallImages.friendlyBall;
}
