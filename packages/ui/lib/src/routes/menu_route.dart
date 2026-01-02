part of 'game_route.dart';

class MenuRoute extends GameRoute {
  MenuRoute();

  @override
  Widget build(GameCoordinator coordinator, BuildContext context) {
    return const Scaffold(body: Center(child: Text('Menu')));
  }

  @override
  Uri toUri() {
    return Uri.parse('/menu');
  }
}
