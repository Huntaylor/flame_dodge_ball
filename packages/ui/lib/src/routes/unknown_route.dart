part of 'game_route.dart';

class UnknownRoute extends GameRoute {
  @override
  Widget build(GameCoordinator coordinator, BuildContext context) {
    return const Scaffold(body: Center(child: Text('Uh-oh!')));
  }

  @override
  Uri toUri() {
    return Uri.parse('/uh-oh');
  }
}
