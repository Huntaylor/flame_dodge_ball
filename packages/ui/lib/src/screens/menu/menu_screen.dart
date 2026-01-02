import 'package:flutter/material.dart';
import 'package:ui/src/routes/route.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                GameCoordinator.instance.navigate(SettingsRoute());
              },
              child: Text('Settings'),
            ),
            ElevatedButton(
              onPressed: () {
                GameCoordinator.instance.navigate(DodgeballGameRoute());
              },
              child: Text('Game'),
            ),
          ],
        ),
      ),
    );
  }
}
