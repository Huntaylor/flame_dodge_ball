part of '../ball.dart';

class SplitterBall extends Ball {
  const SplitterBall({required super.owner});

  @override
  double get speed => 90;

  @override
  double get radius => 15;

  @override
  double get damage => 8;

  @override
  double get cooldown => 1;

  @override
  int get max => 3;

  @override
  String get image => BallImages.splitterBall;
}
