part of 'route.dart';

class DodgeballGameRoute extends Route {
  DodgeballGameRoute();

  @override
  Widget build(GameCoordinator coordinator, BuildContext context) {
    return Scaffold(
      body: GameWidget<DodgeballGame>.controlled(
        gameFactory: () {
          return DodgeballGame(gameBloc: coordinator.getIt.get<GameBloc>());
        },
      ),
    );
  }

  @override
  Uri toUri() {
    return Uri.parse('/menu');
  }
}
