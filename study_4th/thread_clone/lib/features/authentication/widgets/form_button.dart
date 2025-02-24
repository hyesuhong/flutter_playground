import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/utils/ui.dart';

class FormButton extends ConsumerWidget {
  final String label;
  final void Function()? onTap;

  const FormButton({
    super.key,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: Sizes.size40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isDarkMode(ref) ? Colors.white : Colors.black,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isDarkMode(ref) ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }
}
