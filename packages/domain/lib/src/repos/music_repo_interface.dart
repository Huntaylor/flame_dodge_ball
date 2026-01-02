import 'package:domain/src/enums/music.dart';

abstract class MusicRepoInterface {
  const MusicRepoInterface();

  Future<void> play(Music music);
}
