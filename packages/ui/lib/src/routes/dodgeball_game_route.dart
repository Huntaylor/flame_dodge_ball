part of 'game_route.dart';

class DodgeballGameRoute extends GameRoute {
  DodgeballGameRoute();

  @override
  Widget build(GameCoordinator coordinator, BuildContext context) {
    return Scaffold(
      body: GameWidget<DodgeballGame>.controlled(
        gameFactory: () =>
            DodgeballGame(gameBloc: coordinator.getIt.get<GameBloc>()),
      ),
    );
  }

  @override
  Uri toUri() {
    return Uri.parse('/menu');
  }
}
