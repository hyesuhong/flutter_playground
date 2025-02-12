import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class FormButton extends StatelessWidget {
  final String text;
  final bool disabled;
  final void Function()? onTap;

  const FormButton({
    super.key,
    required this.text,
    this.disabled = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: FractionallySizedBox(
        widthFactor: 1,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size12,
            horizontal: Sizes.size10,
          ),
          decoration: BoxDecoration(
            color: disabled
                ? Colors.grey.shade200
                : Theme.of(context).primaryColor,
          ),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 300),
            style: TextStyle(
              color: disabled ? Colors.grey.shade700 : Colors.white,
              fontWeight: FontWeight.w600,
            ),
            child: Text(text),
          ),
        ),
      ),
    );
  }
}
