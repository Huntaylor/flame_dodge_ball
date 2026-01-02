part of '_FEATURE_SNAKE_bloc.dart';

class _FEATURE_PASCALEvent extends Equatable {
  const _FEATURE_PASCALEvent();

  static const create = _$_FEATURE_PASCALEventCreator();

  @override
  List<Object?> get props => _$props;
}

class _Init extends _FEATURE_PASCALEvent {
  const _Init();
}

class _Emit extends _FEATURE_PASCALEvent {
  const _Emit(this.state);

  final _FEATURE_PASCALState state;

  @override
  List<Object?> get props => _$props;
}

class _NotifyOfError extends _FEATURE_PASCALEvent {
  const _NotifyOfError(
    this.message, {
    // ignore: unused_element_parameter
    this.fallback,
  });

  final String message;
  final _FEATURE_PASCALState? fallback;

  @override
  List<Object?> get props => _$props;
}
