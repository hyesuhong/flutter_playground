import 'package:flutter/material.dart';
import 'package:thread_clone/utils/format.dart';
import 'package:thread_clone/widgets/user_profile.dart';

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
          const SizedBox(
            height: 4,
          ),
          Text("${formatCompactNumber(followers)} followers"),
        ],
      ),
      trailing: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: GestureDetector(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 8,
            ),
            child: const Text("Follow"),
          ),
        ),
      ),
    );
  }
}
