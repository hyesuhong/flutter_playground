import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  final String imageUrl;

  const UserProfile({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(48),
      ),
    );
  }
}
