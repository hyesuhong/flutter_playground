import 'package:flutter/material.dart';
import 'package:thread_clone/constants/sizes.dart';

class PostMoreItem extends StatelessWidget {
  final String label;
  final void Function()? onTap;
  final bool isDangerous;

  const PostMoreItem({
    super.key,
    required this.label,
    this.onTap,
    this.isDangerous = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: Sizes.size56,
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size16),
        alignment: Alignment.centerLeft,
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: isDangerous ? Colors.red : null,
          ),
        ),
      ),
    );
  }
}
