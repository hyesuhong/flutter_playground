import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread_clone/constants/sizes.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final void Function()? onTap;

  const CustomIconButton({
    super.key,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: Sizes.size24,
        height: Sizes.size24,
        alignment: Alignment.center,
        child: FaIcon(
          icon,
          size: Sizes.size18,
        ),
      ),
    );
  }
}
