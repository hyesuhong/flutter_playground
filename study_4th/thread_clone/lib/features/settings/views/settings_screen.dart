import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:thread_clone/constants/gaps.dart';
import 'package:thread_clone/constants/routes.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/features/authentication/repos/authentication_repository.dart';
import 'package:thread_clone/features/settings/models/settings_config_model.dart';
import 'package:thread_clone/features/settings/view_models/settings_config_vm.dart';
import 'package:thread_clone/utils/ui.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  void _onBackTap(BuildContext context) {
    context.pop();
  }

  void _onPrivacyTap(BuildContext context) {
    context.pushNamed(Routes.privacy.name);
  }

  void _onLogoutTap(BuildContext context, WidgetRef ref) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text("Log out of your accout?"),
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                ref.read(authRepo).signOut();
                context.goNamed(Routes.signIn.name);
              },
              isDestructiveAction: true,
              child: const Text(
                "Log out",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            CupertinoDialogAction(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                "Cancel",
                style: TextStyle(
                  color: isDarkMode(ref) ? Colors.white : Colors.black,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Appearance? appearance = ref.watch(settingsConfigProvider).appearance;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(
            fontSize: Sizes.size24,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.7,
          ),
        ),
        leadingWidth: Sizes.size80 + Sizes.size4,
        leading: GestureDetector(
          onTap: () => _onBackTap(context),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size12),
            child: const Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.chevronLeft,
                  size: Sizes.size20,
                ),
                Gaps.h4,
                Text(
                  "Back",
                  style: TextStyle(
                    fontSize: Sizes.size18,
                  ),
                ),
              ],
            ),
          ),
        ),
        shape: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SwitchListTile.adaptive(
              secondary: const FaIcon(FontAwesomeIcons.circleHalfStroke),
              title: const Text("Dark Mode"),
              value: appearance == Appearance.dark,
              onChanged: (value) {
                ref
                    .read(settingsConfigProvider.notifier)
                    .setAppearance(value ? Appearance.dark : Appearance.light);
              },
              inactiveThumbColor: isDarkMode(ref) ? Colors.black : Colors.white,
              inactiveTrackColor:
                  isDarkMode(ref) ? Colors.grey.shade800 : Colors.grey.shade500,
              activeTrackColor:
                  isDarkMode(ref) ? Colors.grey.shade500 : Colors.black87,
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var item = _items[index];

                return ListTile(
                  title: Text(item.label),
                  leading: FaIcon(item.icon),
                  onTap: item.label == "Privacy"
                      ? () => _onPrivacyTap(context)
                      : null,
                );
              },
              itemCount: _items.length,
            ),
            Divider(color: Colors.grey.shade300),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size18,
                vertical: Sizes.size4,
              ),
              child: GestureDetector(
                onTap: () => _onLogoutTap(context, ref),
                child: Text(
                  "Log out",
                  style: TextStyle(
                    color: Colors.blue.shade600,
                    fontSize: Sizes.size16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingItem {
  final IconData icon;
  final String label;

  SettingItem({
    required this.icon,
    required this.label,
  });
}

var _items = [
  SettingItem(
    icon: FontAwesomeIcons.userPlus,
    label: "Follow and invite friends",
  ),
  SettingItem(
    icon: FontAwesomeIcons.bell,
    label: "Notifications",
  ),
  SettingItem(
    icon: FontAwesomeIcons.lock,
    label: "Privacy",
  ),
  SettingItem(
    icon: FontAwesomeIcons.circleUser,
    label: "Account",
  ),
  SettingItem(
    icon: FontAwesomeIcons.circleQuestion,
    label: "Help",
  ),
  SettingItem(
    icon: FontAwesomeIcons.circleInfo,
    label: "About",
  ),
];
