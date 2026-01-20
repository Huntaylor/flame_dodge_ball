import 'package:application/application.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/src/routes/route.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({required this.musicBloc, super.key});

  final Factory<MusicBloc> musicBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => musicBloc()..events.play(Music.menu),
      lazy: false,
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/images/platform/dodgeball_texture.png',
                repeat: ImageRepeat.repeat,
              ),
              Column(
                spacing: 8,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      GameCoordinator.instance.navigate(GameRoute());
                    },
                    child: const Text('Play'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      GameCoordinator.instance.navigate(SettingsRoute());
                    },
                    child: const Text('Settings'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
