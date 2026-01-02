import 'package:flutter/material.dart';
import 'package:ui/src/routes/route.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                GameCoordinator.instance.navigate(MenuRoute());
              },
              child: const Text('Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
