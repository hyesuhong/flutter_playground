import 'package:flutter/material.dart';

class PlaceholderScreen extends StatelessWidget {
  final String placeholder;

  const PlaceholderScreen({
    super.key,
    required this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Text(placeholder),
      ),
    );
  }
}
