import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread_clone/models/post_model.dart';
import 'package:thread_clone/widgets/search_user_tile.dart';

List<PostModel> _posts = List.generate(
  20,
  // ignore: avoid_types_as_parameter_names
  (int) => PostModel.generate(),
);

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Search",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.7,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
              child: CupertinoTextField(
                prefix: Container(
                  width: 36,
                  height: 40,
                  alignment: Alignment.center,
                  child: FaIcon(
                    FontAwesomeIcons.magnifyingGlass,
                    size: 18,
                    color: Colors.grey.shade500,
                  ),
                ),
                placeholder: "Search",
                placeholderStyle: TextStyle(
                  color: Colors.grey.shade500,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  PostModel post = _posts[index];
                  return SearchUserTile(
                    username: post.username,
                    description: post.description,
                    followers: post.followers,
                    profileUrl: post.profileUrl,
                  );
                },
                itemCount: _posts.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
