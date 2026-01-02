import 'package:domain/src/enums/music.dart';

abstract class MusicRepo {
  const MusicRepo();

  Future<void> play(Music music);
  Future<void> stop();
}
