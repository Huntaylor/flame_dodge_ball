part of '../ball.dart';

class SplitterBall extends Ball {
  SplitterBall({required super.owner});
  SplitterBall._anchor({required super.owner, required super.anchor})
    : super._anchor();

  @override
  double get speed => 280;

  @override
  double get radius => 8;

  @override
  double get damage => 8;

  @override
  double get cooldown => 1;

  @override
  int get max => 3;

  @override
  String get image => BallImages.splitterBall;

  SplitterBall split(({double x, double y}) anchor) {
    return SplitterBall._anchor(owner: _owner, anchor: anchor);
  }
}
