import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:thread_clone/constants/gaps.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/features/settings/widgets/text_list_tile.dart';
import 'package:thread_clone/utils/ui.dart';

class PrivacyScreen extends ConsumerStatefulWidget {
  const PrivacyScreen({super.key});

  @override
  ConsumerState<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends ConsumerState<PrivacyScreen> {
  bool _isPrivate = false;

  void _onBackTap(BuildContext context) {
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Privacy",
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
            ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                SwitchListTile.adaptive(
                  value: _isPrivate,
                  onChanged: (value) {
                    setState(() {
                      _isPrivate = !_isPrivate;
                    });
                  },
                  title: const Text("Private profile"),
                  secondary: const FaIcon(FontAwesomeIcons.lock),
                  inactiveThumbColor:
                      isDarkMode(ref) ? Colors.black : Colors.white,
                  inactiveTrackColor: isDarkMode(ref)
                      ? Colors.grey.shade800
                      : Colors.grey.shade500,
                  activeTrackColor:
                      isDarkMode(ref) ? Colors.grey.shade500 : Colors.black87,
                ),
                const TextListTile(
                  title: "Mentions",
                  leadingIcon: FontAwesomeIcons.at,
                  hasSubPage: true,
                  selectedOption: "Everyone",
                ),
                const TextListTile(
                  title: "Muted",
                  leadingIcon: FontAwesomeIcons.bellSlash,
                  hasSubPage: true,
                ),
                const TextListTile(
                  title: "Hidden words",
                  leadingIcon: FontAwesomeIcons.eyeSlash,
                  hasSubPage: true,
                ),
                const TextListTile(
                  title: "Profiles you follow",
                  leadingIcon: FontAwesomeIcons.users,
                  hasSubPage: true,
                ),
                const Divider(
                  height: 1,
                ),
                const TextListTile(
                  title: "Other privacy settings",
                  subtitle:
                      "Some settings, like restrict, apply to both Threads and Instagram and canoe managed on Instagram.",
                  isExternal: true,
                ),
                const TextListTile(
                  title: "Blocked profiles",
                  leadingIcon: FontAwesomeIcons.circleXmark,
                  isExternal: true,
                ),
                const TextListTile(
                  title: "Hide likes",
                  leadingIcon: FontAwesomeIcons.heartCircleMinus,
                  isExternal: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
