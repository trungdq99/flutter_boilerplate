import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import '../core/blocs/bootstart/bootstart_bloc.dart';
import '../core/localization/app_localizations.dart';
import '../core/theme/app_theme.dart';
import '../core/widgets/widgets.dart';

import '../core/localization/app_localization_key.dart';
import '../presentations/splash/pages/splash_page.dart';
import 'app.dart';
import '../dependency_injection.dart' as di;

/// [AppBootStart] is the root of your application.
class AppBootStart extends StatelessWidget {
  const AppBootStart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) {
        dInjectionUIThenLoadBootStart(context);
        return t(AppLocalizationKey.appTitle);
      },
      theme: themeData,
      supportedLocales: const [
        Locale('en', 'US'),
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
        for (final supportedLocale in supportedLocales) {
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
          builder: (_, state) {
            if (state is BootStartIsOverState) {
              return const App();
            } else if (state is BootStartOnMessageState) {
              return SplashPage(state.message ?? '');
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  /// [dInjectionUIThenLoadBootStart] Registers the ui dependencies like localization, screenutils(reposiveness) which depends on the context.
  /// Then, fires the [BootStartLoadEvent]
  void dInjectionUIThenLoadBootStart(BuildContext context) {
    di.configureUI(context);
    if (GetIt.instance.get<BootStartBloc>().state is UnBootStartState) {
      GetIt.instance.get<BootStartBloc>().add(BootStartLoadEvent());
    }
  }
}
