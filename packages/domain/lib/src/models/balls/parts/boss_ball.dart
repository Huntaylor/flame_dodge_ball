part of '../ball.dart';

class BossBall extends Ball {
  const BossBall({required super.owner});

  @override
  double get speed => 180;

  @override
  double get radius => 12;

  @override
  double get damage => 50;

  @override
  double get cooldown => 1;

  @override
  int get max => 1;

  @override
  String get image => BallImages.bossBall;
}
