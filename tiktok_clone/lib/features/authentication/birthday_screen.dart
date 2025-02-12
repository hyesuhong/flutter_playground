import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';
import 'package:tiktok_clone/features/onboarding/interest_screen.dart';

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({super.key});

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  final TextEditingController _birthdayController = TextEditingController();

  final DateTime _initialDate =
      DateTime.now().subtract(const Duration(days: 365 * 12));

  @override
  void initState() {
    super.initState();
    _setTextFieldDate(_initialDate);
  }

  @override
  void dispose() {
    _birthdayController.dispose();
    super.dispose();
  }

  void _setTextFieldDate(DateTime date) {
    final parsedDate = date.toString().split(' ').first;
    _birthdayController.value = TextEditingValue(text: parsedDate);
  }

  void _onNextTap() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const InterestScreen(),
      ),
      (route) => false,
    );
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
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
                "When's your birthday",
                style: TextStyle(
                  fontSize: Sizes.size20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v4,
              Text(
                "Your birthday won't be shown publicly.",
                style: TextStyle(
                  fontSize: Sizes.size16,
                  color: Colors.grey[500],
                ),
              ),
              Gaps.v40,
              TextField(
                controller: _birthdayController,
                cursorColor: Theme.of(context).primaryColor,
                autocorrect: false,
                onEditingComplete: _onNextTap,
                decoration: InputDecoration(
                  enabled: false,
                  hintText: 'Birthday',
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
              Gaps.v40,
              FormButton(
                text: 'Next',
                onTap: _onNextTap,
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          height: Sizes.size96 * 3,
          color: Colors.grey[50],
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            maximumDate: _initialDate,
            initialDateTime: _initialDate,
            onDateTimeChanged: _setTextFieldDate,
          ),
        ),
      ),
    );
  }
}
