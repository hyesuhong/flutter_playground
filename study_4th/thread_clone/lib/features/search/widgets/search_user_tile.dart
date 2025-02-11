import 'package:flutter/material.dart';
import 'package:thread_clone/common/user_profile/user_profile.dart';
import 'package:thread_clone/constants/gaps.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/utils/format.dart';

class SearchUserTile extends StatelessWidget {
  final String username;
  final String description;
  final int followers;
  final String profileUrl;

  const SearchUserTile({
    super.key,
    required this.username,
    required this.description,
    required this.followers,
    required this.profileUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      titleAlignment: ListTileTitleAlignment.titleHeight,
      leading: UserProfile(imageUrl: profileUrl),
      title: Text(username),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            description,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Gaps.v4,
          Text("${formatCompactNumber(followers)} followers"),
        ],
      ),
      trailing: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(Sizes.size8),
        ),
        child: GestureDetector(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size24,
              vertical: Sizes.size8,
            ),
            child: const Text("Follow"),
          ),
        ),
      ),
    );
  }
}
