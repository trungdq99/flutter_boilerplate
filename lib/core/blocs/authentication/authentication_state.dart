part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  final String? token;
  final UserEntity? user;
  const AuthenticationState({this.token, this.user});

  @override
  List<Object?> get props => [token, user];
}

/// Initial State
class UnAuthenticationState extends AuthenticationState {
  const UnAuthenticationState({super.token, super.user});
  UnAuthenticationState.fromOldState(AuthenticationState state,
      {String? token, UserEntity? user})
      : super(token: token ?? state.token, user: user ?? state.user);
}

// ignore: must_be_immutable
class AuthenticationOnMessageState extends AuthenticationState
    with BlocOnMessageStateBase {
  AuthenticationOnMessageState({super.token, super.user});
  AuthenticationOnMessageState.fromOldState(
    AuthenticationState state, {
    String? token,
    UserEntity? user,
    required String message,
    MessageType type = MessageType.info,
  }) : super(
          token: token ?? state.token,
          user: user ?? state.user,
        ) {
    this.message = message;
    this.type = type;
  }
}

/// Initialized
class InAuthenticationState extends AuthenticationState {
  const InAuthenticationState({super.token, super.user});
  InAuthenticationState.fromOldState(
    AuthenticationState state, {
    String? token,
    UserEntity? user,
  }) : super(
          token: token ?? state.token,
          user: user ?? state.user,
        );
}
