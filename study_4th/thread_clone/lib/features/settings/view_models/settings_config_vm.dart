import 'package:flutter/material.dart';
import 'package:thread_clone/features/settings/models/settings_config_model.dart';
import 'package:thread_clone/features/settings/repos/settings_config_repo.dart';

class SettingsConfigViewModel extends ChangeNotifier {
  final SettingsConfigRepository _repository;

  late final SettingsConfigModel _model = SettingsConfigModel(
    appearance: _repository.getAppearance(),
  );

  SettingsConfigViewModel(this._repository);

  Appearance? get appearance => _model.appearance;

  void setAppearance(Appearance appearance) {
    _repository.setAppearance(appearance);
    _model.appearance = appearance;
    notifyListeners();
  }
}
