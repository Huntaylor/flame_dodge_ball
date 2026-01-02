part of 'music_bloc.dart';

class MusicEvent extends Equatable {
  const MusicEvent();

  @override
  List<Object?> get props => _$props;
}

class _Play extends MusicEvent {
  const _Play(this.music);

  final Music music;

  @override
  List<Object?> get props => _$props;
}
