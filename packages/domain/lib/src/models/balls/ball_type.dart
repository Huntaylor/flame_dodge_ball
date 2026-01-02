import 'package:assets/assets.dart';

part 'parts/boss_ball.dart';
part 'parts/enemy_ball.dart';
part 'parts/friendly_ball.dart';
part 'parts/giant_ball.dart';
part 'parts/regular_ball.dart';
part 'parts/speed_ball.dart';
part 'parts/splitter_ball.dart';

sealed class BallType {
  const BallType();

  double get speed;
  double get radius;
  double get damage => 0;
  String get image => '';
}
