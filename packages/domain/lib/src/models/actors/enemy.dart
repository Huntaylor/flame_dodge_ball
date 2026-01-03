import 'package:assets/assets.dart';
import 'package:domain/src/models/actors/actor.dart';

final class Enemy extends Actor {
  Enemy() : super(health: 1);

  @override
  String get image => PlayerImages.player1Running;

  @override
  String get animation => PlayerAnimations.player1Running;

  @override
  ({double height, double width}) get size => (height: 64, width: 32);

  @override
  double get speed => 200;
}
