import 'package:domain/src/models/balls/ball.dart';
import 'package:domain/src/models/id.dart';

abstract class Actor {
  Actor({required double health}) : _health = health, id = const Id();

  final Id id;
  double get speed;
  ({double height, double width}) get size;
  String get image;
  String get animation;

  double _health;
  double get health => _health;

  bool get isDead => _health <= 0;
  bool get isAlive => !isDead;

  final List<Id> _hitByIds = [];

  void getHitBy(Ball ball) {
    if (ball.ownerId == id || _hitByIds.contains(ball.id)) {
      return;
    }
    _hitByIds.add(ball.id);
    _health -= ball.damage;
  }
}
