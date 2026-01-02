import 'package:assets/assets.dart';

part 'parts/normal_ball.dart';

abstract class Ball {
  const Ball();

  double get speed;
  double get radius;
  double get damage;
  String get image;
}
