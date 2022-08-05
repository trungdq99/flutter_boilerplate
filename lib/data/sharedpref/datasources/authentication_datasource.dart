import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/localization/app_localization_base.dart';
import '../../exceptions/sharedpref_exception.dart';
import '../sharedpref_consts.dart';

@lazySingleton
class AuthenticationDataSource extends AppLocalizationBase {
  final SharedPreferences sharedPreferences;

  AuthenticationDataSource({required this.sharedPreferences});

  Future<void> saveToken(String token) async {
    try {
      bool result =
          await sharedPreferences.setString(SharedPrefConsts.tokenKey, token);
      if (!result) {
        throw SharedPrefException(t("error_when_save", params: ["token"]));
      }
    } catch (err) {
      throw SharedPrefException(err);
    }
  }

  Future<String> getToken() async {
    try {
      String result =
          sharedPreferences.getString(SharedPrefConsts.tokenKey) ?? '';

      return result;
    } catch (err) {
      throw SharedPrefException(err);
    }
  }

  Future<bool> hasToken() async {
    try {
      bool result = sharedPreferences.containsKey(SharedPrefConsts.tokenKey);
      return result;
    } catch (err) {
      throw SharedPrefException(err);
    }
  }

  Future<bool> clearToken() async {
    try {
      bool result = await sharedPreferences.remove(SharedPrefConsts.tokenKey);
      return result;
    } catch (err) {
      throw SharedPrefException(err);
    }
  }
}
