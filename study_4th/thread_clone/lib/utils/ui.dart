import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thread_clone/features/settings/models/settings_config_model.dart';
import 'package:thread_clone/features/settings/view_models/settings_config_vm.dart';

bool isDarkMode(WidgetRef ref) {
  final Appearance? appearance = ref.watch(settingsConfigProvider).appearance;
  return appearance == Appearance.dark;
}
