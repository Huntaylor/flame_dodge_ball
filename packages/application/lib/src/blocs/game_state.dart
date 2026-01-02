part of 'game_bloc.dart';

sealed class GameState extends Equatable {
  const GameState();

  @override
  List<Object?> get props => _$props;
}

class _Loading extends GameState {
  const _Loading();
}

class _Ready extends GameState {
  const _Ready(this.status);

  final GameStatus status;
}
