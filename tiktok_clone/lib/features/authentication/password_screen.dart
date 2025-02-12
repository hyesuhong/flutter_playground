import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/birthday_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_valid_check.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();

  String _password = '';
  bool _obscureText = true;

  bool get _isDisabled {
    return !(_isPasswordCharacterValid() && _isPasswordLengthValid());
  }

  @override
  void initState() {
    super.initState();

    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  bool _isPasswordLengthValid() {
    return _password.isNotEmpty &&
        _password.length >= 8 &&
        _password.length <= 20;
  }

  bool _isPasswordCharacterValid() {
    final regexp = RegExp(
      r"(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-])",
    );

    return regexp.hasMatch(_password);
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onClearTap() {
    _passwordController.clear();
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _onSubmit() {
    if (_isDisabled) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BirthdayScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Sign up',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size24,
            vertical: Sizes.size40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Create pasword',
                style: TextStyle(
                  fontSize: Sizes.size20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v40,
              TextField(
                controller: _passwordController,
                obscureText: _obscureText,
                autocorrect: false,
                onEditingComplete: _onSubmit,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                  hintText: 'Make it strong',
                  suffix: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: _onClearTap,
                        child: FaIcon(
                          FontAwesomeIcons.solidCircleXmark,
                          size: Sizes.size20,
                          color: Colors.grey.shade400,
                        ),
                      ),
                      Gaps.h12,
                      GestureDetector(
                        onTap: _toggleObscureText,
                        child: FaIcon(
                          _obscureText
                              ? FontAwesomeIcons.eye
                              : FontAwesomeIcons.eyeSlash,
                          size: Sizes.size20,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ],
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                      width: Sizes.size1,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                      width: Sizes.size1,
                    ),
                  ),
                ),
              ),
              Gaps.v8,
              const Text(
                'Your password must have:',
                style: TextStyle(
                  fontSize: Sizes.size14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gaps.v12,
              Column(
                children: [
                  FormValidCheck(
                    text: '8 to 20 characters',
                    isDisabled: !_isPasswordLengthValid(),
                  ),
                  Gaps.v4,
                  FormValidCheck(
                    text: 'Letters, number, and special characters',
                    isDisabled: !_isPasswordCharacterValid(),
                  ),
                ],
              ),
              Gaps.v40,
              FormButton(
                text: 'Next',
                disabled: _isDisabled,
                onTap: _onSubmit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
