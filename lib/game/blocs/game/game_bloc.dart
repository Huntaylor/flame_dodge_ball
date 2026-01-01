import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'game_event.dart';
part 'game_state.dart';

part 'game_bloc.g.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(GameState.initial()) {
    on<GameEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
