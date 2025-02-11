import 'package:flutter/material.dart';
import 'package:thread_clone/constants/sizes.dart';

class UserProfile extends StatelessWidget {
  final String imageUrl;

  const UserProfile({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Sizes.size48,
      height: Sizes.size48,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(Sizes.size48),
      ),
    );
  }
}
