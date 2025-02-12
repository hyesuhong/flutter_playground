import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class FormValidCheck extends StatelessWidget {
  final String text;
  final bool isDisabled;

  const FormValidCheck({
    super.key,
    required this.text,
    this.isDisabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FaIcon(
          FontAwesomeIcons.circleCheck,
          size: Sizes.size20,
          color: isDisabled ? Colors.grey[400] : Colors.green,
        ),
        Gaps.h8,
        Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
          ),
        )
      ],
    );
  }
}
