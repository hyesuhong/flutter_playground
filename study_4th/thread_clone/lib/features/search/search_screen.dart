import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread_clone/common/user_profile/models/user_model.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/features/search/widgets/search_user_tile.dart';

List<UserModel> _users = List.generate(
  20,
  (index) => UserModel.generate(),
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
            fontSize: Sizes.size32,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.7,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: Sizes.size16,
          right: Sizes.size16,
          bottom: Sizes.size16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Sizes.size40,
              child: CupertinoTextField(
                prefix: Container(
                  width: Sizes.size36,
                  height: Sizes.size40,
                  alignment: Alignment.center,
                  child: FaIcon(
                    FontAwesomeIcons.magnifyingGlass,
                    size: Sizes.size18,
                    color: Colors.grey.shade500,
                  ),
                ),
                placeholder: "Search",
                placeholderStyle: TextStyle(
                  color: Colors.grey.shade500,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(Sizes.size8),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  UserModel user = _users[index];
                  return SearchUserTile(
                    username: user.username,
                    description: user.description,
                    followers: user.followers,
                    profileUrl: user.profileUrl,
                  );
                },
                itemCount: _users.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
