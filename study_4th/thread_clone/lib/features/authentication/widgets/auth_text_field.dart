import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final String? placeholder;
  final bool isObscure;

  const AuthTextField({
    super.key,
    this.placeholder,
    this.isObscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isObscure,
      decoration: InputDecoration(
        hintText: placeholder,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade500),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).appBarTheme.foregroundColor!,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
