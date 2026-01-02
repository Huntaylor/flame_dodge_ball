import 'package:audioplayers/audioplayers.dart';
import 'package:domain/domain.dart';
import 'package:get_it_injector/get_it_injector.dart';

@lazySingleton
class MusicRepoImpl implements MusicRepo {
  MusicRepoImpl() : _player = AudioPlayer();

  final AudioPlayer _player;

  @override
  Future<void> play(Music music) async {
    await _player.play(AssetSource(music.path));
  }

  @override
  Future<void> stop() async {
    await _player.stop();
  }
}
