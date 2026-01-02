part of '../ball.dart';

class RegularBall extends Ball {
  RegularBall({required super.owner});

  @override
  double get speed => 300;

  @override
  double get radius => 10;

  @override
  double get damage => 10;

  @override
  double get cooldown => 1;

  @override
  int get max => 5;

  @override
  String get image => BallImages.regularBall;
}
