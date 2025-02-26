import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread_clone/common/post/models/post_model.dart';
import 'package:thread_clone/common/post/widgets/post_list_tile.dart';
import 'package:thread_clone/constants/sizes.dart';

List<PostModel> _posts = List.generate(
  20,
  (index) => PostModel.generate(),
);

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FaIcon(
          FontAwesomeIcons.threads,
          size: Sizes.size32,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Sizes.size16),
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            PostModel post = _posts[index];
            return PostListTile(
              profileUrl: post.user.profileUrl,
              username: post.user.username,
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
