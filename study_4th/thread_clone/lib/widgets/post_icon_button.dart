import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostIconButton extends StatelessWidget {
  final IconData icon;
  final void Function()? onTap;

  const PostIconButton({
    super.key,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 24,
        height: 24,
        alignment: Alignment.center,
        child: FaIcon(
          icon,
          size: 18,
        ),
      ),
    );
  }
}
