// ignore_for_file: avoid_print

import 'dart:io';

import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:yaml_edit/yaml_edit.dart';

const fs = LocalFileSystem();

void main() async {
  final root = fs.currentDirectory.parent;
  final assets = root.childDirectory(fs.path.join('packages', 'assets'));

  if (fs.directory(fs.path.join('lib', 'assets')) case final dir
      when dir.existsSync()) {
    await dir.delete(recursive: true);
  }

  {
    fs.currentDirectory = root;
    final result = Process.runSync('dart', ['run', 'spider', 'build']);

    if (result.exitCode != 0) {
      print('Spider build failed');
      print(result.stderr);
      return;
    }

    fs.currentDirectory = assets.childDirectory(fs.path.join('lib', 'assets'));
  }

  final files = fs.currentDirectory.listSync();

  print('Found ${files.length} files');

  print('Formatting files');
  for (final file in files) {
    if (file is! File) continue;

    final content = file.readAsStringSync();

    if (content.contains('// dart format width=200')) {
      continue;
    }

    file.writeAsStringSync('''
// dart format width=200
$content''');
  }

  {
    final result = Process.runSync('dart', ['format', '.']);

    if (result.exitCode != 0) {
      print('Dart format failed');
      print(result.stderr);
      return;
    }
  }

  print('Formatting done');

  final dirs = <String>{};

  final assetPathPattern = RegExp(r"'(assets\/.*)\/");

  print('Updating asset paths');
  for (final file in files) {
    if (file is! File) continue;

    final content = file.readAsStringSync();

    final matches = assetPathPattern.allMatches(content);
    for (final match in matches) {
      if (match.group(1) case final String str) {
        dirs.add(str);
      }
    }

    final updated = content
        .replaceAll("'assets/", "'")
        .replaceAll("'images/", "'");

    file.writeAsStringSync(updated);
  }

  fs.currentDirectory = root;

  final pubspec = fs.file('pubspec.yaml');
  final yaml = YamlEditor(pubspec.readAsStringSync())
    ..update(['flutter', 'assets'], dirs.toList()..sort());

  pubspec.writeAsStringSync(yaml.toString());

  print('Complete!');
}
