part of 'route.dart';

class MenuRoute extends Route {
  MenuRoute();

  @override
  Widget build(GameCoordinator coordinator, BuildContext context) {
    return MenuScreen(musicBloc: coordinator._getIt.get);
  }

  @override
  Uri toUri() {
    return Uri.parse('/menu');
  }
}
