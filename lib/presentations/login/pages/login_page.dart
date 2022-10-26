import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../core/widgets/widgets.dart';
import '../bloc/login_bloc.dart';
import '../widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  final LoginBloc _loginBloc = GetIt.instance.get<LoginBloc>();

  LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _loginBloc,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const LoginPageTop(),
                  SizedBox(
                    height: convertSize(15),
                  ),
                  const LoginPageFormTitle(),
                  const Divider(),
                  SizedBox(
                    height: convertSize(10),
                  ),
                  const LoginPageForm()
                ],
              ),
            ),
            blocMessageBuilder(context, _loginBloc),
            blocProgressBuilder(_loginBloc)
          ],
        ),
      ),
    );
  }
}
