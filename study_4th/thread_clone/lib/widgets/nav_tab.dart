import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavTab extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final void Function()? onTap;

  const NavTab({
    super.key,
    required this.icon,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedOpacity(
          opacity: isSelected ? 1 : 0.5,
          duration: const Duration(milliseconds: 300),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                icon,
                color: Colors.black,
              ),
              const SizedBox(height: 4),
            ],
          ),
        ),
      ),
    );
  }
}
