import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread_clone/models/post_model.dart';
import 'package:thread_clone/widgets/post_content.dart';

List<PostModel> _posts = List.generate(
  20,
  // ignore: avoid_types_as_parameter_names
  (int) => PostModel.generate(),
);

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FaIcon(
          FontAwesomeIcons.threads,
          size: 32,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            PostModel post = _posts[index];
            return PostContent(
              profileUrl: post.profileUrl,
              username: post.username,
              createdAt: post.createdAt,
              contentText: post.contentText,
              contentImageUrls: post.contentImageUrls,
              replies: post.replies,
              likes: post.likes,
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: _posts.length,
        ),
      ),
    );
  }
}
