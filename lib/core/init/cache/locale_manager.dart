import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_auth/core/constants/enums/locale_keys_enum.dart';
import 'package:flutter_auth/core/init/lang/locale_keys.g.dart';

class LocaleManager {
  LocaleManager._init() {
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }
  static final LocaleManager _instance = LocaleManager._init();

  SharedPreferences? _preferences;

  static LocaleManager get instance => _instance;

  Future<void> clearAll() async {
    await _preferences?.clear();
  }

  Future<void> setBoolValue(PreferencesKeys key, bool value) async {
    await _preferences?.setBool(key.toString(), value);
  }

  static Future prefrencesInit() async {
    instance._preferences ??= await SharedPreferences.getInstance();
  }

  void setString(PreferencesKeys key, String value) async {
    await _preferences?.setString(key.toString(), value);
  }

  Future<void> setStringValue(PreferencesKeys key, String value) async {
    await _preferences!.setString(key.toString(), value);
  }

  String getStringValue(PreferencesKeys key) => _preferences?.getString(key.toString()) ?? '';
}
