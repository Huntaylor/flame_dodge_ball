part of 'route.dart';

class GameRoute extends Route {
  GameRoute();

  @override
  Widget build(GameCoordinator coordinator, BuildContext context) {
    return Scaffold(
      body: GameWidget<DodgeballGame>.controlled(
        gameFactory: () {
          return DodgeballGame(gameBloc: coordinator._getIt.get<GameBloc>());
        },
      ),
    );
  }

  @override
  Uri toUri() {
    return Uri.parse('/menu');
  }
}
