import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part '_FEATURE_SNAKE_bloc.g.dart';
part '_FEATURE_SNAKE_event.dart';
part '_FEATURE_SNAKE_state.dart';

class _FEATURE_PASCALBloc
    extends Bloc<_FEATURE_PASCALEvent, _FEATURE_PASCALState> {
  _FEATURE_PASCALBloc() : super(const _Loading()) {
    on<_Init>(_init);
    on<_Emit>((event, emit) => emit(event.state));
    on<_NotifyOfError>((event, emit) {
      final fallback = event.fallback ?? state;
      emit(_NotifyError(event.message));
      emit(fallback);
    });
  }

  Future<void> _init(_Init event, Emitter<_FEATURE_PASCALState> emit) async {
    emit(const _Ready());
  }
}
