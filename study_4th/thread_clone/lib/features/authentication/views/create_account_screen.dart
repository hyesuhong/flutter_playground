import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:thread_clone/constants/gaps.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/features/authentication/view_models/sign_up_view_model.dart';
import 'package:thread_clone/features/authentication/widgets/auth_text_field.dart';
import 'package:thread_clone/features/authentication/widgets/form_button.dart';

/* 
[ ] The Create Account should have a form with two inputs: email and password.
[ ] When the user submits the form, they should be signed up using Firebase Authentication.
[ ] When the user signs up, they should be taken to the Home Screen.
 */

class CreateAccountScreen extends ConsumerStatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  ConsumerState<CreateAccountScreen> createState() =>
      _CreateAccountScreenState();
}

class _CreateAccountScreenState extends ConsumerState<CreateAccountScreen> {
  final TextEditingController _emailController = TextEditingController();
  String _email = "";

  final TextEditingController _passwordController = TextEditingController();
  String _password = "";

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSubmit() {
    if (_email.isEmpty || _password.isEmpty) {
      return;
    }

    final state = ref.read(signUpForm.notifier).state;
    ref.read(signUpForm.notifier).state = {
      "email": _email,
      "password": _password,
    };
    ref.read(signUpProvider.notifier).signUp(context);
  }

  @override
  void initState() {
    super.initState();

    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });

    _emailController.addListener(() {
      setState(() {
        _email = _emailController.text;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
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
                AuthTextField(
                  placeholder: "Email",
                  controller: _emailController,
                  type: TextInputType.emailAddress,
                ),
                Gaps.v20,
                AuthTextField(
                  placeholder: "Password",
                  isObscure: true,
                  controller: _passwordController,
                ),
                Gaps.v40,
                FormButton(
                  label: "Create account",
                  onTap: _onSubmit,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      context.go('/sign-in');
                    },
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: const SizedBox(
                        child: Text("Sign in"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
