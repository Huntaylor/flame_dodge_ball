// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// GetItInjectorGenerator
// **************************************************************************

// ignore: lines_longer_than_80_chars
// ignore_for_file: cs_forbidden_imports,directives_ordering,unnecessary_lambdas,prefer_const_constructors,require_trailing_commas,implementation_imports,lines_longer_than_80_chars,duplicate_ignore
import 'package:get_it/get_it.dart';
import 'package:application/src/blocs/game_bloc.dart' as i_game_bloc;
import 'package:application/src/blocs/music_bloc.dart' as i_music_bloc;
import 'package:domain/src/repos/music_repo.dart' as i_music_repo;

extension GetItX on GetIt {
  void init() {
    registerFactory(() => i_game_bloc.GameBloc());
    registerLazySingleton(
      () => i_music_bloc.MusicBloc(get<i_music_repo.MusicRepo>()),
    );
  }
}
