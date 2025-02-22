import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:thread_clone/constants/gaps.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/features/authentication/widgets/auth_text_field.dart';
import 'package:thread_clone/features/authentication/widgets/form_button.dart';

/* 
[ ] The Sign In should have a link to the Create Account screen.
[x] The Sign In screen should have a form with two inputs: email and password.
[ ] When the user submits the form, they should be signed in using Firebase Authentication.
[ ] When the user signs in, they should be taken to the Home Screen.
 */

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gaps.v96,
              Container(
                width: Sizes.size64,
                height: Sizes.size64,
                decoration: BoxDecoration(
                  color: Theme.of(context).appBarTheme.foregroundColor,
                  borderRadius: BorderRadius.circular(Sizes.size12),
                ),
                alignment: Alignment.center,
                child: FaIcon(
                  FontAwesomeIcons.threads,
                  size: Sizes.size32,
                  color: Theme.of(context).appBarTheme.backgroundColor,
                ),
              ),
              Gaps.v80,
              Gaps.v40,
              const AuthTextField(
                placeholder: "Email",
              ),
              Gaps.v20,
              const AuthTextField(
                placeholder: "Password",
                isObscure: true,
              ),
              Gaps.v40,
              const FormButton(label: "Sign in"),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    context.go('/create-account');
                  },
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: const SizedBox(
                      child: Text("Create new account"),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
