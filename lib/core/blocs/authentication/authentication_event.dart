part of 'authentication_bloc.dart';

class AuthenticationEvent
    extends BlocEventBase<AuthenticationState, AuthenticationBloc> {
  AuthenticationEvent({super.toState});
}

/// If user authenticated before, then yields [InAuthenticationState].
/// Otherwise, yields [UnAuthenticationState]
/// [LoadAuthenticationEvent] calls after user login.
class LoadAuthenticationEvent extends AuthenticationEvent {
  LoadAuthenticationEvent();

  @override
  Future<void> applyAsync({
    required AuthenticationState currentState,
    required AuthenticationBloc bloc,
    required Emitter<AuthenticationState> emit,
  }) async {
    final resultUser = await bloc.getAuthenticatedUser(NoParams());
    UserEntity? userEntity = bloc.extractEither(resultUser);
    if (userEntity != null) {
      String? token =
          bloc.extractEither<String>(await bloc.getUserToken(NoParams()));
      emit(InAuthenticationState(user: userEntity, token: token));
    } else {
      await Future.delayed(const Duration(seconds: 1));
      emit(const UnAuthenticationState());
    }
  }
}

/// [BootStartLoadAuthenticationEvent] is used for setting the authenticated user
/// [BootStartLoadAuthenticationEvent] is called by [BootStartBloc] via [LoadBootStartEvent]
class BootStartLoadAuthenticationEvent extends AuthenticationEvent {
  /// Authenticated User
  final UserEntity? user;

  /// Its token
  final String? token;
  BootStartLoadAuthenticationEvent({
    this.user,
    this.token,
  });

  @override
  Future<void> applyAsync({
    required AuthenticationState currentState,
    required AuthenticationBloc bloc,
    required Emitter<AuthenticationState> emit,
  }) async {
    emit(InAuthenticationState(user: user, token: token));
  }
}

/// [AuthenticationLogoutEvent] is used for logout user.
/// [AuthenticationLogoutEvent] will delete clear token, and yield [UnAuthenticationState]
class AuthenticationLogoutEvent extends AuthenticationEvent {
  AuthenticationLogoutEvent();

  @override
  Future<void> applyAsync({
    required AuthenticationState currentState,
    required AuthenticationBloc bloc,
    required Emitter<AuthenticationState> emit,
  }) async {
    emit(AuthenticationOnMessageState.fromOldState(currentState,
        message: t(AppLocalizationKey.exiting)));
    await bloc.clearUserToken(NoParams());
    await Future.delayed(const Duration(seconds: 1));
    emit(const UnAuthenticationState(token: null, user: null));
  }
}
