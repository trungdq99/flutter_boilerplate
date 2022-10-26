import 'package:logger/logger.dart';

/// Show beautiful log
class LoggerUtils {
  static final Logger _logger = Logger(printer: PrettyPrinter(methodCount: 0));
  LoggerUtils();

  /// Show Info log
  static void info(
    dynamic message, [
    dynamic error,
    StackTrace? stackTrace,
  ]) =>
      _logger.i(message, error, stackTrace);

  /// Show Error log
  static void error(
    dynamic message, [
    dynamic error,
    StackTrace? stackTrace,
  ]) =>
      _logger.e(message, error, stackTrace);

  /// Show Verbose log
  static void verbose(
    dynamic message, [
    dynamic error,
    StackTrace? stackTrace,
  ]) =>
      _logger.v(message, error, stackTrace);
}
