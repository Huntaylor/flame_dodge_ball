import 'package:application/application.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void setup() {
  Bloc.observer = AppBlocObserver();
}
