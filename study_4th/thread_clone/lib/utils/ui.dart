import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thread_clone/features/settings/models/settings_config_model.dart';
import 'package:thread_clone/features/settings/view_models/settings_config_vm.dart';

bool isDarkMode(BuildContext context) {
  return context.watch<SettingsConfigViewModel>().appearance == Appearance.dark;
}
