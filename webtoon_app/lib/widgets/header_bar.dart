import 'package:flutter/material.dart';
import 'package:webtoon_app/styles/font.dart';

class HeaderBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double headerHeight = 56;
  final List<Widget>? actions;

  const HeaderBar({
    super.key,
    required this.title,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black12,
        backgroundColor: Colors.white,
        foregroundColor: Colors.grey[600],
        elevation: 5,
        actions: actions,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontVariations: [NotoSansKRWeight.w500],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(headerHeight);
}
