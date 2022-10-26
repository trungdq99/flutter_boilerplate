import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/blocs/base/base.dart';
import '../../../core/consts/enums.dart';
// import '../../../domain/usecases/authentication/set_token.dart';
// import '../../../domain/usecases/user/do_login.dart';
import '../../../domain/usecases/authentication/set_token.dart' as set_token;
import '../../../domain/usecases/user/do_login.dart' as do_login;

part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> with AppBlocBase {
  final do_login.DoLogin doLogin;
  final set_token.SetUserToken setToken;

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
