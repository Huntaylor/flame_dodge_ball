// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_bloc.dart';

// **************************************************************************
// BlocEnhancerGenerator
// **************************************************************************

class _GameBlocEvents {
  const _GameBlocEvents(this._bloc);

  final GameBloc _bloc;

  void init() {
    if (_bloc.isClosed) return;
    _bloc.add(_Init());
  }
}

extension $GameBlocEventsX on GameBloc {
  _GameBlocEvents get events => _GameBlocEvents(this);
}

/// Creates a new instance of [GameEvent] with the given parameters
///
/// Intended to be used for **_TESTING_** purposes only.
class _$GameEventCreator {
  const _$GameEventCreator();

  _Init init() => _Init();
}

extension $GameStateTypingX on GameState {
  bool get isLoading => this is _Loading;

  _Loading get asLoading => this as _Loading;

  _Loading? get asIfLoading => this is _Loading ? this as _Loading : null;

  bool get isReady => this is _Ready;

  _Ready get asReady => this as _Ready;

  _Ready? get asIfReady => this is _Ready ? this as _Ready : null;
}

/// Creates a new instance of [GameState] with the given parameters
///
/// Intended to be used for **_TESTING_** purposes only.
class _$GameStateCreator {
  const _$GameStateCreator();

  _Loading loading() => _Loading();

  _Ready ready(GameStatus status) => _Ready(status);
}

// **************************************************************************
// EquatableGenerator
// **************************************************************************

extension _$GameEventEquatableAnnotations on GameEvent {
  List<Object?> get _$props => [];
}

extension _$GameStateEquatableAnnotations on GameState {
  List<Object?> get _$props => [];
}
