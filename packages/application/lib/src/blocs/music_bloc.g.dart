// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_bloc.dart';

// **************************************************************************
// BlocEnhancerGenerator
// **************************************************************************

class _MusicBlocEvents {
  const _MusicBlocEvents(this._bloc);

  final MusicBloc _bloc;

  void play(Music music) {
    if (_bloc.isClosed) return;
    _bloc.add(_Play(music));
  }
}

extension $MusicBlocEventsX on MusicBloc {
  _MusicBlocEvents get events => _MusicBlocEvents(this);
}

extension $MusicStateTypingX on MusicState {
  bool get isLoading => this is _Loading;

  _Loading get asLoading => this as _Loading;

  _Loading? get asIfLoading => this is _Loading ? this as _Loading : null;

  bool get isReady => this is _Ready;

  _Ready get asReady => this as _Ready;

  _Ready? get asIfReady => this is _Ready ? this as _Ready : null;
}

// **************************************************************************
// EquatableGenerator
// **************************************************************************

extension _$MusicEventEquatableAnnotations on MusicEvent {
  List<Object?> get _$props => [];
}

extension _$PlayEquatableAnnotations on _Play {
  List<Object?> get _$props => [music];
}

extension _$MusicStateEquatableAnnotations on MusicState {
  List<Object?> get _$props => [];
}

extension _$ReadyEquatableAnnotations on _Ready {
  List<Object?> get _$props => [music];
}
