import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

part 'game_bloc.g.dart';
part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(_Loading()) {
    on<_Init>(_init);
  }

  FutureOr<void> _init(_Init event, Emitter<GameState> emit) async {
    emit(_Ready(GameStatus.mainMenu));
  }
}
