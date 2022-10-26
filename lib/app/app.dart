import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../core/blocs/authentication/authentication_bloc.dart';
import '../presentations/home/pages/home_page.dart';
import '../presentations/login/pages/login_page.dart';
import '../presentations/splash/pages/splash_page.dart';

/// [app] runs after BootStart is over.
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.instance.get<AuthenticationBloc>(),
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (_, state) {
          if (state is UnAuthenticationState) {
            return LoginPage();
          } else if (state is InAuthenticationState) {
            return HomePage();
          } else if (state is AuthenticationOnMessageState) {
            return SplashPage(state.message ?? '');
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
