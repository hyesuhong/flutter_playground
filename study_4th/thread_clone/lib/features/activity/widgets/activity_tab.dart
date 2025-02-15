import 'package:flutter/material.dart';
import 'package:thread_clone/utils/ui.dart';

class ActivityTab extends StatelessWidget {
  final String text;
  final bool isSelected;

  const ActivityTab({
    super.key,
    required this.text,
    required this.isSelected,
  });

  Decoration? _buildTabDecorationByThemeMode(BuildContext context) {
    return isDarkMode(context)
        ? BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            border: Border.all(color: isSelected ? Colors.white : Colors.grey),
            borderRadius: BorderRadius.circular(8),
          )
        : BoxDecoration(
            color: isSelected ? Colors.black : Colors.white,
            border: Border.all(color: isSelected ? Colors.black : Colors.grey),
            borderRadius: BorderRadius.circular(8),
          );
  }

  Color _getTextColorByThemeMode(BuildContext context) {
    final Color selectedColor;
    final Color defaultColor;

    if (isDarkMode(context)) {
      selectedColor = Colors.black87;
      defaultColor = Colors.white;
    } else {
      selectedColor = Colors.white;
      defaultColor = Colors.black87;
    }

    return isSelected ? selectedColor : defaultColor;
  }

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        width: 100,
        height: 36,
        decoration: _buildTabDecorationByThemeMode(context),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: _getTextColorByThemeMode(context),
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
