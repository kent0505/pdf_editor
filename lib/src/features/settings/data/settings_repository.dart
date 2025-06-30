import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants.dart';

abstract interface class SettingsRepository {
  const SettingsRepository();

  bool getFaceID();
  Future<void> setFaceID(bool value);
}

final class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl({required SharedPreferences prefs}) : _prefs = prefs;

  final SharedPreferences _prefs;

  @override
  Future<void> setFaceID(bool value) async {
    await _prefs.setBool(Keys.faceID, value);
  }

  @override
  bool getFaceID() {
    return _prefs.getBool(Keys.faceID) ?? false;
  }
}
