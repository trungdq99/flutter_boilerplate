import 'package:flutter_bloc/flutter_bloc.dart';

import '../../localization/app_localization_base.dart';

/// [BlocEventBase] is base class for all BlocEvents.
/// Its basic functions are [applyAsync] method, and localizations.
/// It extends [AppLocalizationBase] to get localization features.
abstract class BlocEventBase<State, Bloc> extends AppLocalizationBase {
  final State? toState;
  BlocEventBase({this.toState});

  /// [applyAsync] is a common function across all event classes.
  /// If not override the [applyAsync] method, it yield [toState] or [currentState]
  Future<void> applyAsync({
    required State currentState,
    required Bloc bloc,
    required Emitter<State> emit,
  }) async {
    emit(toState ?? currentState);
  }
}
