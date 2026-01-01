part of 'game_bloc.dart';

enum GameStatus { mainMenu, start, end }

@CopyWith()
class GameState extends Equatable {
  const GameState({required this.gameStatus});

  final GameStatus gameStatus;

  const GameState.initial() : gameStatus = GameStatus.mainMenu;

  @override
  List<Object?> get props => _$props;
}
