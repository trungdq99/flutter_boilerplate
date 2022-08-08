import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';

import 'core/blocs/authentication/authentication_bloc.dart';
import 'core/blocs/bootstart/bootstart_bloc.dart';
import 'core/localization/app_localizations.dart';
import 'core/theme/app_theme.dart';
import 'core/utils/logger_utils.dart';
import 'core/widgets/index.dart';
import 'dependency_injection.dart' as di;
import 'presentations/home/pages/home_page.dart';
import 'presentations/login/pages/login_page.dart';
import 'presentations/splash/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.configure(di.Env.prod);
  runZonedGuarded(
    () => const AppBootStart(),
    (error, stack) {
      LoggerUtils.error('Error when start booting App', error, stack);
    },
  );
}

/// [AppBootStart] is the root of your application.
class AppBootStart extends StatelessWidget {
  const AppBootStart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) {
        dInjectionUIThenLoadBootStart(context);
        return t('app_title');
      },
      theme: themeData,
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('tr', 'US'),
        Locale('tr', 'TR'),
        Locale('vi', 'VN'),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        if (locale == null) {
          return null;
        }
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      home: BlocProvider(
        create: (_) => GetIt.instance.get<BootStartBloc>(),
        child: BlocBuilder<BootStartBloc, BootStartState>(
          builder: (context, state) {
            if (state is BootStartIsOverState) {
              return app(context);
            } else if (state is BootstartStateOnMessageState) {
              return SplashPage(state.message ?? '');
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  /// [app] runs after BootStart is over.
  Widget app(BuildContext context) {
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

  /// [dInjectionUIThenLoadBootStart] Registers the ui dependencies like localization, screenutils(reposiveness) which depends on the context.
  /// Then, fires the [LoadBootStartEvent]
  void dInjectionUIThenLoadBootStart(BuildContext context) {
    di.configureUI(context);
    if (GetIt.instance.get<BootStartBloc>().state is UnBootstartState) {
      GetIt.instance.get<BootStartBloc>().add(LoadBootStartEvent());
    }
  }
}
