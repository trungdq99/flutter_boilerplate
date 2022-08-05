part of 'login_form_field_cubit.dart';

class LoginFormFieldState extends Equatable {
  final bool showPassword;
  const LoginFormFieldState({this.showPassword = false});

  @override
  List<Object> get props => [showPassword];
}
