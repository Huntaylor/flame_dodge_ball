part of 'music_bloc.dart';

class MusicState extends Equatable {
  const MusicState();

  @override
  List<Object?> get props => _$props;
}

class _Loading extends MusicState {
  const _Loading();
}

class _Ready extends MusicState {
  const _Ready(this.music);

  final Music music;

  @override
  List<Object?> get props => _$props;
}
