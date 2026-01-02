import 'package:application/application.dart';
import 'package:domain/domain.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:ui/src/game/dodgeball_game.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({required this.gameBloc, super.key});

  final Factory<GameBloc> gameBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameWidget<DodgeballGame>.controlled(
        gameFactory: () {
          return DodgeballGame(gameBloc: gameBloc());
        },
      ),
    );
  }
}
