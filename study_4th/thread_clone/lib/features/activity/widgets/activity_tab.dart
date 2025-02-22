import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thread_clone/utils/ui.dart';

class ActivityTab extends ConsumerWidget {
  final String text;
  final bool isSelected;

  const ActivityTab({
    super.key,
    required this.text,
    required this.isSelected,
  });

  Decoration? _buildTabDecorationByThemeMode(WidgetRef ref) {
    return isDarkMode(ref)
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

  Color _getTextColorByThemeMode(WidgetRef ref) {
    final Color selectedColor;
    final Color defaultColor;

    if (isDarkMode(ref)) {
      selectedColor = Colors.black87;
      defaultColor = Colors.white;
    } else {
      selectedColor = Colors.white;
      defaultColor = Colors.black87;
    }

    return isSelected ? selectedColor : defaultColor;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Tab(
      child: Container(
        width: 100,
        height: 36,
        decoration: _buildTabDecorationByThemeMode(ref),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: _getTextColorByThemeMode(ref),
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
