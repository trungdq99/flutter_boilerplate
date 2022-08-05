import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/localization/app_localizations.dart';
import 'core/utils/connectivity_utils.dart';
import 'core/utils/screen_utils.dart';
import 'data/local/local_consts.dart';
import 'dependency_injection.config.dart';

GetIt getIt = GetIt.instance;

@injectableInit
Future<void> configure(String environment) async {
  // we await for async dependencies.
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerFactory<SharedPreferences>(() => sharedPreferences);

  final appDocumentDir = await getApplicationDocumentsDirectory();
  final dbPath = p.join(appDocumentDir.path, LocalConsts.dbName);
  Database database = await databaseFactoryIo.openDatabase(dbPath);
  getIt.registerFactory<Database>(() => database);

  getIt.registerFactory<ConnectivityUtils>(
      () => ConnectivityUtils(connectivity: Connectivity()));

  $initGetIt(getIt, environment: environment);
}

abstract class Env {
  static const dev = "dev";
  static const prod = "prod";
}

/// [configureUI] Registers the ui dependencies like localization, screenutils(reposiveness) which depends on the context.
void configureUI(BuildContext context) {
  if (!getIt.isRegistered<AppLocalizations>() &&
      AppLocalizations.of(context) != null) {
    getIt.registerLazySingleton<AppLocalizations>(
        () => AppLocalizations.of(context)!);
  }

  if (!getIt.isRegistered<ScreenUtils>()) {
    getIt.registerLazySingleton(() => ScreenUtils(context));
  }
}
