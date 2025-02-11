import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread_clone/common/button/custom_icon_button.dart';
import 'package:thread_clone/common/user_profile/user_profile.dart';
import 'package:thread_clone/constants/gaps.dart';
import 'package:thread_clone/constants/sizes.dart';

class WritingScreen extends StatefulWidget {
  const WritingScreen({super.key});

  @override
  State<WritingScreen> createState() => _WritingScreenState();
}

class _WritingScreenState extends State<WritingScreen> {
  bool _isFilled = false;

  void _onCancelTap(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _onInputChange(String value) {
    _isFilled = value.isNotEmpty;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "New Post",
          style: TextStyle(
            fontSize: Sizes.size20,
            fontWeight: FontWeight.bold,
          ),
        ),
        shape: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
        leading: GestureDetector(
          onTap: () => _onCancelTap(context),
          child: Container(
            alignment: Alignment.center,
            child: const Text(
              "Cancel",
              style: TextStyle(
                fontSize: Sizes.size16,
              ),
            ),
          ),
        ),
        leadingWidth: Sizes.size80,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size24,
          horizontal: Sizes.size16,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Column(
                  children: [
                    UserProfile(imageUrl: "https://i.pravatar.cc/300"),
                    Gaps.v8
                  ],
                ),
                Gaps.h16,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "username",
                        style: TextStyle(
                          fontSize: Sizes.size16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextField(
                        onChanged: _onInputChange,
                        maxLines: null,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Start a thread...",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Gaps.v8,
                      const CustomIconButton(
                        icon: FontAwesomeIcons.paperclip,
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size16,
          ),
          alignment: Alignment.centerRight,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: _isFilled ? 1 : 0.3,
            child: GestureDetector(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size20,
                  vertical: Sizes.size8,
                ),
                child: Text(
                  "Post",
                  style: TextStyle(
                    color: Colors.blue.shade400,
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
