import 'package:shared_preferences/shared_preferences.dart';
import 'package:thread_clone/features/settings/models/settings_config_model.dart';

class SettingsConfigRepository {
  static const String _appearance = "appearance";

  final SharedPreferences _preferences;

  SettingsConfigRepository(this._preferences);

  Future<void> setAppearance(Appearance appearance) async {
    _preferences.setString(_appearance, appearance.name);
  }

  Appearance? getAppearance() {
    String? appearance = _preferences.getString(_appearance);
    print(appearance);
    if (appearance == null) {
      return null;
    }

    var appearances = Appearance.values;
    var appearanceIndex =
        appearances.indexWhere((value) => value.name == appearance);
    print(appearanceIndex);
    return appearanceIndex < 0 ? null : appearances[appearanceIndex];
  }
}
