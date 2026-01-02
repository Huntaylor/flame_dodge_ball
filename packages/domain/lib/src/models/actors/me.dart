import 'package:assets/assets.dart';
import 'package:domain/src/models/actors/actor.dart';

final class Me extends Actor {
  Me() : super(health: 100);

  @override
  String get image => PlayerImages.player1Running;

  @override
  String get animation => PlayerAnimations.player1Running;

  @override
  late final ({double height, double width}) size = (height: 64, width: 32);

  @override
  double get speed => 200;
}
