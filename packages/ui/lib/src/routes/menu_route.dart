part of 'route.dart';

class MenuRoute extends Route {
  MenuRoute();

  @override
  Widget build(GameCoordinator coordinator, BuildContext context) {
    return const MenuScreen();
  }

  @override
  Uri toUri() {
    return Uri.parse('/menu');
  }
}
