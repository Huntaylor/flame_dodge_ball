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
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  GameCoordinator.instance.navigate(SettingsRoute());
                },
                child: const Text('Settings'),
              ),
              ElevatedButton(
                onPressed: () {
                  GameCoordinator.instance.navigate(DodgeballGameRoute());
                },
                child: const Text('Game'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
