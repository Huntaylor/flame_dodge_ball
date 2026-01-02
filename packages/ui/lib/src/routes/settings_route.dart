part of 'route.dart';

class SettingsRoute extends Route {
  SettingsRoute();

  @override
  Widget build(GameCoordinator coordinator, BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                coordinator.navigate(MenuRoute());
              },
              child: const Text('Menu'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Uri toUri() {
    return Uri.parse('/settings');
  }
}
