import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class PostVideoButton extends StatelessWidget {
  const PostVideoButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          right: Sizes.size24,
          child: Container(
            width: Sizes.size20,
            height: Sizes.size32,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size8,
            ),
            decoration: const BoxDecoration(
              color: Color(0xff61D4F0),
              borderRadius: BorderRadius.all(
                Radius.circular(Sizes.size8),
              ),
            ),
          ),
        ),
        Positioned(
          left: Sizes.size24,
          child: Container(
            width: Sizes.size20,
            height: Sizes.size32,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size8,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(Sizes.size8),
              ),
            ),
          ),
        ),
        Container(
          height: Sizes.size32,
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size12,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(Sizes.size8),
            ),
          ),
          child: const Center(
            child: FaIcon(
              FontAwesomeIcons.plus,
              color: Colors.black,
              size: Sizes.size16 + Sizes.size2,
            ),
          ),
        )
      ],
    );
  }
}
