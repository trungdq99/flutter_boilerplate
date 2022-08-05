import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/blocs/bases/bloc_event_base.dart';
import '../../../domain/usecases/authentication/set_token.dart' as st;
import '../../../domain/usecases/user/do_login.dart' as dl;
import 'index.dart';

class LoginEvent extends BlocEventBase<LoginState, LoginBloc> {
  LoginEvent({LoginState? toState}) : super(toState: toState);
}

class LoadLoginEvent extends LoginEvent {
  final String username;
  final String password;

  LoadLoginEvent(this.username, this.password);

  @override
  Future<void> applyAsync({
    required LoginState currentState,
    required LoginBloc bloc,
    required Emitter<LoginState> emit,
  }) async {
    emit(LoginOnProgressState.fromOldState(currentState));
    final loginResult = await bloc.doLogin(dl.Params(username, password));
    String? token = bloc.extractEither<String>(loginResult);
    if (token != null) {
      bloc.extractEither<void>(await bloc.setToken(st.Params(token)));
      await Future.delayed(const Duration(seconds: 1));
      emit(InLoginStateState());
    }
  }
}
