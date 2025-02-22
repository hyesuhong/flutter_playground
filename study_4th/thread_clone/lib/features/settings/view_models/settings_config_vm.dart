import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thread_clone/features/settings/models/settings_config_model.dart';
import 'package:thread_clone/features/settings/repos/settings_config_repo.dart';

class SettingsConfigViewModel extends Notifier<SettingsConfigModel> {
  final SettingsConfigRepository _repository;

  SettingsConfigViewModel(this._repository);

  void setAppearance(Appearance appearance) {
    _repository.setAppearance(appearance);
    state = SettingsConfigModel(
      appearance: appearance,
    );
  }

  @override
  SettingsConfigModel build() {
    return SettingsConfigModel(
      appearance: _repository.getAppearance(),
    );
  }
}

final settingsConfigProvider =
    NotifierProvider<SettingsConfigViewModel, SettingsConfigModel>(
  () => throw UnimplementedError(),
);
