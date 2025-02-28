import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thread_clone/common_widgets/button/custom_icon_button.dart';
import 'package:thread_clone/constants/gaps.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/features/camera/camera_screen.dart';
import 'package:thread_clone/features/post/view_models/create_post_view_model.dart';
import 'package:thread_clone/features/profile/widgets/user_profile.dart';
import 'package:thread_clone/utils/ui.dart';

class WritingScreen extends ConsumerStatefulWidget {
  const WritingScreen({super.key});

  @override
  ConsumerState<WritingScreen> createState() => _WritingScreenState();
}

class _WritingScreenState extends ConsumerState<WritingScreen> {
  String _content = "";
  List<XFile>? _pictures;

  void _onCancelTap(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _onInputChange(String value) {
    _content = value;
    setState(() {});
  }

  Future<void> _onFileTap(BuildContext context) async {
    List<XFile>? pictures = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CameraScreen(),
      ),
    );

    if (pictures == null || pictures.isEmpty) {
      return;
    }

    _pictures = pictures;
    setState(() {});
  }

  void _onPostTap() async {
    ref
        .read(createPostProvider.notifier)
        .createPost(context, contentText: _content);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text(
          "New Post",
          style: TextStyle(
            fontSize: Sizes.size20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        shape: Border(
          bottom: BorderSide(
            color:
                isDarkMode(ref) ? Colors.grey.shade700 : Colors.grey.shade300,
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
                      CustomIconButton(
                        icon: FontAwesomeIcons.paperclip,
                        onTap: () => _onFileTap(context),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (_pictures != null)
              Container(
                height: Sizes.size64 * 4,
                padding: const EdgeInsets.only(left: Sizes.size64),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    var file = _pictures![index];
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(Sizes.size16),
                          child: Image.file(
                            File(file.path),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: Sizes.size4,
                          right: Sizes.size4,
                          child: IconButton(
                            onPressed: () {
                              _pictures!.removeAt(index);
                              setState(() {});
                            },
                            icon: FaIcon(
                              FontAwesomeIcons.solidCircleXmark,
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => Gaps.h8,
                  itemCount: _pictures!.length,
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size16,
          ),
          alignment: Alignment.centerRight,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: _content.isNotEmpty ? 1 : 0.3,
            child: GestureDetector(
              onTap: _onPostTap,
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
