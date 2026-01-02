// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// GetItInjectorGenerator
// **************************************************************************

// ignore: lines_longer_than_80_chars
// ignore_for_file: cs_forbidden_imports,directives_ordering,unnecessary_lambdas,prefer_const_constructors,require_trailing_commas,implementation_imports,lines_longer_than_80_chars,duplicate_ignore
import 'package:get_it/get_it.dart';
import 'package:data/src/repos/music/music_repo_impl.dart' as i_music_repo_impl;
import 'package:domain/src/repos/music_repo.dart' as i_music_repo;

extension GetItX on GetIt {
  void init() {
    _registerRepo();
  }

  void _registerRepo() {
    registerLazySingleton<i_music_repo.MusicRepo>(
      () => i_music_repo_impl.MusicRepoImpl(),
    );
  }
}
