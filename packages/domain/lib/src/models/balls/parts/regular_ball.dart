part of '../ball.dart';

class RegularBall extends Ball {
  const RegularBall({required super.owner});

  @override
  double get speed => 100;

  @override
  double get radius => 10;

  @override
  double get damage => 10;

  @override
  String get image => BallImages.regularBall;
}
