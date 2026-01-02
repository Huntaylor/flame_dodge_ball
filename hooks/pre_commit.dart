import 'package:hooksman/hooksman.dart';

Hook main() {
  return PreCommitHook(
    tasks: [
      ReRegisterHooks(),
      SequentialTasks(
        tasks: [
          ShellTask(
            include: [Glob('**.dart')],
            workingDirectory: 'packages/application',
            commands: (files) {
              return ['dart run build_runner build'];
            },
          ),
          ShellTask(
            include: [Glob('**.dart')],
            workingDirectory: 'packages/domain',
            commands: (files) {
              return ['dart run build_runner build'];
            },
          ),
          ShellTask(
            include: [Glob('**.dart')],
            workingDirectory: 'packages/data',
            commands: (files) {
              return ['dart run build_runner build'];
            },
          ),
          ParallelTasks(
            tasks: [
              ShellTask(
                include: [Glob('**.dart')],
                commands: (files) {
                  return ['barreler build --config barreler.yaml'];
                },
              ),
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
          ),
        ],
      ),
    ],
  );
}
