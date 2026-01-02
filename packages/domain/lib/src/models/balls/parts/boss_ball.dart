part of '../ball.dart';

class BossBall extends Ball {
  const BossBall({required super.owner});

  @override
  double get speed => 80;

  @override
  double get radius => 25;

  @override
  double get damage => 50;

  @override
  double get cooldown => 1;

  @override
  int get max => 1;

  @override
  String get image => BallImages.bossBall;
}
