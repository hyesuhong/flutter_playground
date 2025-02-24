import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final String? placeholder;
  final bool isObscure;
  final TextEditingController? controller;
  final TextInputType? type;
  final bool enabled;

  const AuthTextField({
    super.key,
    this.placeholder,
    this.isObscure = false,
    this.controller,
    this.type,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: type,
      obscureText: isObscure,
      cursorColor: Colors.grey.shade500,
      autocorrect: false,
      autofocus: false,
      decoration: InputDecoration(
        enabled: enabled,
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
