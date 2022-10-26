part of 'login_bloc.dart';

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
    final loginResult = await bloc.doLogin(do_login.Params(username, password));
    String? token = bloc.extractEither<String>(loginResult);
    if (token != null) {
      bloc.extractEither<void>(await bloc.setToken(set_token.Params(token)));
      await Future.delayed(const Duration(seconds: 1));
      emit(InLoginStateState());
    }
  }
}
