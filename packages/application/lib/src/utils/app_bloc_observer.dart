// ignore_for_file: strict_raw_type, avoid_dynamic_calls, avoid_print
// dart format off
import 'package:bloc/bloc.dart' ;
import 'package:change_case/change_case.dart';

// dart format on

class AppBlocObserver extends BlocObserver {
  AppBlocObserver();

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);

    try {
      print('🐣 [${bloc.toLogString()}] created');
    } catch (_) {}
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);

    try {
      print('❌ [${bloc.toLogString()}] closed');
    } catch (_) {}
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    try {
      final state = change.nextState;

      if (state.runtimeType.toString() case '_NotifyError' || '_Error') {
        if ((state as dynamic).message case final String message) {
          if (message.trim() case final String message
              when message.isNotEmpty) {
            print('[${bloc.runtimeType}] $message');
          }
        }
      }
    } catch (_) {}

    try {
      final blocName = bloc.toLogString();

      final props = _getProps(change.nextState);

      String toString;

      if (props.isEmpty) {
        toString = '${change.nextState}'.replaceAll('()', '');
      } else {
        toString = '${change.nextState.runtimeType}';

        if (props.isNotEmpty) {
          toString += '(${props.join(', ')})';
        }
      }

      print(
        '👉 [$blocName] '
        '${_toLog(change.currentState)} '
        '| $toString',
      );
    } catch (_) {
      // ignore error
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);

    print('💀 [${bloc.toLogString()}] $error');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);

    try {
      final props = _getProps(event);

      String toString;

      if (props.isEmpty) {
        toString = '${event ?? 'Unknown'}'.replaceAll('()', '');
      } else {
        toString = '${event.runtimeType}';

        if (props.isNotEmpty) {
          toString += '(${props.join(', ')})';
        }
      }
      print('🔥 [${bloc.toLogString()}] $toString');
    } catch (_) {
      // ignore error
    }
  }
}

extension _BlocBaseX on BlocBase {
  String toLogString() {
    final segments = '$runtimeType'.toNoCase().toUpperCase().split(' ');
    final blocName = segments.fold('', (previousValue, element) {
      if (element == 'BLOC') {
        return previousValue;
      }

      if (previousValue.isEmpty) {
        return element;
      }

      return '${previousValue}_$element';
    });

    final code = '$hashCode'.substring(0, 4);

    return '$blocName #$code';
  }
}

String _toLog(dynamic obj) {
  if (obj is Enum) {
    return '$obj';
  }

  return '${obj.runtimeType}';
}

List<String> _getProps(dynamic obj) {
  final cleanProps = <String>[];
  var props = <dynamic>[];

  try {
    props = obj.props as List;
  } catch (e) {
    if (e is! NoSuchMethodError) {
      return [];
    }
  }

  for (final prop in props) {
    cleanProps.add(_formatProp(prop));
  }

  return cleanProps;
}

String _formatProp(dynamic prop) {
  // Handle null
  if (prop == null) return 'null';

  // Handle primitives and simple types directly
  if (prop is num || prop is bool || prop is String) {
    final str = '$prop';
    // Truncate long strings
    return str.length > 50 ? '${str.substring(0, 47)}...' : str;
  }

  // Handle DateTime
  if (prop is DateTime) return prop.toIso8601String();

  // Handle Enum
  if (prop is Enum) return '$prop';

  // Handle Iterable (List, Set, etc.)
  if (prop is Iterable) {
    if (prop.isEmpty) return '[]';
    final first = prop.first;
    return '${first.runtimeType} (${prop.length})';
  }

  // Handle Map
  if (prop is Map) {
    if (prop.isEmpty) return '{}';
    return 'Map (${prop.length})';
  }

  // For complex objects (like Equatable models), just use runtimeType
  // to avoid expensive toString() calls that stringify all nested props
  return '${prop.runtimeType}';
}
