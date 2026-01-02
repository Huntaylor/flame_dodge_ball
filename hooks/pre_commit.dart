import 'package:hooksman/hooksman.dart';

Hook main() {
  return PreCommitHook(
    tasks: [
      ReRegisterHooks(),
      ShellTask(
        include: [Glob('**.dart')],
        commands: (files) {
          return ['dart format ${files.join(' ')}'];
        },
      ),
      ShellTask(
        include: [Glob('**.dart')],
        commands: (files) {
          return ['dart analyze . --fatal-infos --fatal-warnings'];
        },
      ),
    ],
  );
}
