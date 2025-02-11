import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread_clone/constants/gaps.dart';
import 'package:thread_clone/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  void _onBackTap(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _onLogoutTap(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text("Log out of your accout?"),
          actions: [
            CupertinoDialogAction(
              onPressed: () => Navigator.of(context).pop(),
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
              child: const Text(
                "Cancel",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var item = _items[index];

                return ListTile(
                  title: Text(item.label),
                  leading: FaIcon(item.icon),
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
                onTap: () => _onLogoutTap(context),
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
  final void Function()? onTap;

  SettingItem({
    required this.icon,
    required this.label,
    this.onTap,
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
