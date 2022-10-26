import 'dart:async';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'app/app_boot_start.dart';
import 'core/utils/logger_utils.dart';
import 'dependency_injection.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.configure(Environment.dev);
  runZonedGuarded(
    () => runApp(const AppBootStart()),
    (error, stack) {
      LoggerUtils.error('Error when start booting App', error, stack);
    },
  );
}
