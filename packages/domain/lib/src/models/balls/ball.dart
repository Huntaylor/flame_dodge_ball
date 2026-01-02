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
  Ball({required Actor owner}) : id = Id(), _owner = owner, _anchor = null;

  Ball._anchor({required Actor owner, required ({double x, double y}) anchor})
    : id = Id(),
      _owner = owner,
      _anchor = anchor;

  final Actor _owner;
  Id get ownerId => _owner.id;

  final ({double x, double y})? _anchor;
  ({double x, double y}) get anchor {
    if (_anchor case final anchor?) {
      return anchor;
    }

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
  double get cooldown;

  /// The maximum number of balls that can be thrown by the actor.
  ///
  /// When the actor has reached the maximum number of balls, the actor will not be able to throw any more balls.
  /// As soon as the ball is [dispose]d, the actor can throw a new ball.
  int get max;

  void dispose() {
    _owner.removeBall(this);
  }

  @override
  List<Object?> get props => [id, speed, radius, damage, image];
}
