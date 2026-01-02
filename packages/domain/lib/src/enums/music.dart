import 'package:assets/assets.dart';

enum Music {
  menu(Audio.sample);

  const Music(this.path);

  final String path;
}
