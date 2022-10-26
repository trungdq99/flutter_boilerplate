import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'login_form_field_state.dart';

@injectable
class LoginFormFieldCubit extends Cubit<LoginFormFieldState> {
  LoginFormFieldCubit() : super(const LoginFormFieldState());

  toggleShowPassword() =>
      emit(LoginFormFieldState(showPassword: !state.showPassword));
}
