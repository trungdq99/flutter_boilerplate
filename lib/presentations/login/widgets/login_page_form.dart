import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../core/blocs/authentication/authentication_bloc.dart';
import '../../../core/localization/app_localization_key.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/widgets.dart';
import '../bloc/login_bloc.dart';
import '../cubit/login_form_field_cubit.dart';

class LoginPageForm extends StatefulWidget {
  const LoginPageForm({Key? key}) : super(key: key);

  @override
  State<LoginPageForm> createState() => _LoginPageFormState();
}

class _LoginPageFormState extends State<LoginPageForm> {
  TextEditingController usernameTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  final AuthenticationBloc _authenticationBloc =
      GetIt.instance.get<AuthenticationBloc>();
  final LoginFormFieldCubit _loginFormFieldCubit = LoginFormFieldCubit();
  late LoginBloc _loginBloc;
  StreamSubscription<LoginState>? loginBlocSubscription;

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    loginBlocSubscription = _loginBloc.stream.listen((state) {
      if (state is InLoginStateState) {
        _authenticationBloc.add(LoadAuthenticationEvent());
      }
    });
  }

  @override
  void dispose() {
    loginBlocSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _loginFormFieldCubit,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: AppFadeAnimation(
          duration: const Duration(milliseconds: 1000),
          child: Column(
            children: <Widget>[
              AppTextField(
                hintText: widget.t(AppLocalizationKey.lpUsernameHint),
                controller: usernameTextController,
                icon: Icons.person,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(widget.convertSize(20)),
                        topRight: Radius.circular(widget.convertSize(20))),
                    side: BorderSide(color: AppColors.grey[200]!)),
              ),
              BlocBuilder<LoginFormFieldCubit, LoginFormFieldState>(
                  builder: (context, state) {
                return AppTextField(
                  hintText: widget.t(AppLocalizationKey.lpPasswordHint),
                  controller: passwordTextController,
                  obscureText: !state.showPassword,
                  icon: Icons.remove_red_eye,
                  onIconClick: () {
                    _loginFormFieldCubit.toggleShowPassword();
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(widget.convertSize(20)),
                          bottomRight: Radius.circular(widget.convertSize(20))),
                      side: BorderSide(color: AppColors.grey[200]!)),
                );
              }),
              SizedBox(
                height: widget.convertSize(20.0),
              ),
              AppFadeAnimation(
                duration: const Duration(milliseconds: 1400),
                child: AppGradientButton(
                  buttonText: widget.t(AppLocalizationKey.lpLoginButton),
                  onTap: () {
                    _loginBloc.add(LoadLoginEvent(usernameTextController.text,
                        passwordTextController.text));
                  },
                ),
              ),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
