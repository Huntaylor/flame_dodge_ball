part of '_FEATURE_SNAKE_bloc.dart';

class _FEATURE_PASCALState extends Equatable {
  const _FEATURE_PASCALState();

  static const create = _$_FEATURE_PASCALStateCreator();

  @override
  List<Object?> get props => _$props;
}

class _Error extends _FEATURE_PASCALState {
  const _Error(this.message);

  final String message;

  @override
  List<Object?> get props => _$props;
}

class _NotifyError extends _Error {
  const _NotifyError(super.message);
}

class _Loading extends _FEATURE_PASCALState {
  const _Loading();
}

class _Ready extends _FEATURE_PASCALState {
  const _Ready();

  @override
  List<Object?> get props => _$props;
}
