import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread_clone/constants/gaps.dart';
import 'package:thread_clone/constants/sizes.dart';

class TextListTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? leadingIcon;
  final bool isExternal;
  final bool hasSubPage;
  final String? selectedOption;

  const TextListTile({
    super.key,
    required this.title,
    this.subtitle,
    this.leadingIcon,
    this.isExternal = false,
    this.hasSubPage = false,
    this.selectedOption,
  });

  Widget _buildTitle() {
    return subtitle == null
        ? Text(title)
        : Text(
            title,
            style: const TextStyle(
              fontSize: Sizes.size16,
              fontWeight: FontWeight.bold,
              height: Sizes.size2,
            ),
          );
  }

  Widget? _buildSubtitle() {
    if (subtitle == null) {
      return null;
    }

    return Text(
      subtitle!,
      style: const TextStyle(
        color: Colors.grey,
      ),
    );
  }

  Widget? _buildTrailing() {
    if (isExternal) {
      return const FaIcon(
        FontAwesomeIcons.arrowUpRightFromSquare,
        size: Sizes.size20,
        color: Colors.grey,
      );
    }

    if (hasSubPage) {
      const moreIcon = FaIcon(
        FontAwesomeIcons.chevronRight,
        size: Sizes.size20,
        color: Colors.grey,
      );

      return selectedOption == null
          ? moreIcon
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  selectedOption!,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: Sizes.size14,
                    letterSpacing: -0.2,
                  ),
                ),
                Gaps.h4,
                moreIcon,
              ],
            );
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: _buildTitle(),
      subtitle: _buildSubtitle(),
      leading: leadingIcon == null ? null : FaIcon(leadingIcon),
      trailing: _buildTrailing(),
      isThreeLine: isExternal && subtitle != null,
    );
  }
}
