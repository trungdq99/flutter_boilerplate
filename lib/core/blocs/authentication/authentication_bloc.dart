import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/user_entity.dart';
import '../../../domain/usecases/authentication/clear_token.dart';
import '../../../domain/usecases/usecase.dart';
import '../../../domain/usecases/user/get_user_by_token.dart';
import '../../../domain/usecases/authentication/get_token.dart';
import '../../consts/enums.dart';
import '../../localization/app_localization_key.dart';
import '../base/base.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

@lazySingleton
class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState>
    with AppBlocBase {
  ClearUserToken clearUserToken;
  GetUserByToken getAuthenticatedUser;
  GetUserToken getUserToken;
  AuthenticationBloc(
      {required this.getAuthenticatedUser,
      required this.getUserToken,
      required this.clearUserToken})
      : super(const UnAuthenticationState()) {
    on<AuthenticationEvent>(
      (event, emit) =>
          event.applyAsync(currentState: state, bloc: this, emit: emit),
    );
  }

  @override
  void toOnMessageState(String message, MessageType type) {
    add(AuthenticationEvent(
        toState: AuthenticationOnMessageState.fromOldState(state,
            message: message, type: type)));
  }
}
