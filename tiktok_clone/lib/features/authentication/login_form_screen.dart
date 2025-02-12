import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';
import 'package:tiktok_clone/features/onboarding/interest_screen.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void _onSubmitTap() {
    if (_formKey.currentState != null) {
      bool isValid = _formKey.currentState!.validate();

      if (isValid) {
        _formKey.currentState!.save();

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const InterestScreen(),
          ),
          (route) => false,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Log in',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size24,
          vertical: Sizes.size40,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please fill email input';
                  }

                  final regexp = RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                  );

                  return regexp.hasMatch(value) ? null : 'Email not valid';
                },
                onSaved: (newValue) {
                  if (newValue != null) {
                    _formData['email'] = newValue;
                  }
                },
              ),
              Gaps.v16,
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please fill password input';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  if (newValue != null) {
                    _formData['password'] = newValue;
                  }
                },
              ),
              Gaps.v32,
              FormButton(
                text: 'Log in',
                onTap: _onSubmitTap,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
