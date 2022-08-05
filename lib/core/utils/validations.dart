import '../consts/app_consts.dart';

/// [Validations] is validation class all application level.
class Validations {
  static bool lNotNullOrEmpty(List<dynamic>? list) => list?.isNotEmpty == true;

  static bool sNotNullOrEmpty(String? string) => string?.isNotEmpty == true;

  static bool isUrl(String? string) {
    if (string?.isNotEmpty != true) {
      return false;
    }
    return RegExp(AppConsts.emailRegex).firstMatch(string!) != null;
  }
}
