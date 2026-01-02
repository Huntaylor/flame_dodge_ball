part of 'route.dart';

class SettingsRoute extends Route {
  SettingsRoute();

  @override
  Widget build(GameCoordinator coordinator, BuildContext context) {
    return const SettingsScreen();
  }

  @override
  Uri toUri() {
    return Uri.parse('/settings');
  }
}
