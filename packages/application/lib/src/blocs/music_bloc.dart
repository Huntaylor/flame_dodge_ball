import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it_injector/get_it_injector.dart';

part 'music_bloc.g.dart';
part 'music_event.dart';
part 'music_state.dart';

@lazySingleton
class MusicBloc extends Bloc<MusicEvent, MusicState> {
  MusicBloc(this._musicRepo) : super(const _Loading()) {
    on<_Play>(_play);
  }

  final MusicRepo _musicRepo;

  Future<void> _play(_Play event, Emitter<MusicState> emit) async {
    await _musicRepo.play(event.music);
    emit(_Ready(event.music));
  }
}
