import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/blocs/bases/bloc_base.dart';
import '../../../core/consts/enums.dart';
import '../../../domain/usecases/authentication/set_token.dart';
import '../../../domain/usecases/user/do_login.dart';
import 'index.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> with AppBlocBase {
  final DoLogin doLogin;
  final SetUserToken setToken;

  LoginBloc({required this.doLogin, required this.setToken})
      : super(UnLoginState()) {
    on<LoginEvent>(
      (event, emit) =>
          event.applyAsync(currentState: state, bloc: this, emit: emit),
    );
  }

  @override
  void toOnMessageState(String message, MessageType type) {
    add(
      LoginEvent(
        toState: LoginOnMessageState.fromOldState(state,
            type: type, message: message),
      ),
    );
  }
}
