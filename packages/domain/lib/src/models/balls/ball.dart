// ignore_for_file: avoid_field_initializers_in_const_classes

import 'package:assets/assets.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

part 'parts/boss_ball.dart';
part 'parts/enemy_ball.dart';
part 'parts/friendly_ball.dart';
part 'parts/giant_ball.dart';
part 'parts/regular_ball.dart';
part 'parts/speed_ball.dart';
part 'parts/splitter_ball.dart';

sealed class Ball extends Equatable {
  const Ball({required Actor owner}) : id = const Id(), _owner = owner;

  final Actor _owner;
  Id get ownerId => _owner.id;

  ({double x, double y}) get anchor {
    return (
      x: _owner.position.x + (_owner.size.width * .8),
      y: _owner.position.y + (_owner.size.height * .3),
    );
  }

  final Id id;
  double get speed;
  double get radius;
  double get damage;
  String get image;

  @override
  List<Object?> get props => [id, speed, radius, damage, image];
}
